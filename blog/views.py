from datetime import date
from django.core.cache import cache
from django.db.models import Q, F
from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse
from blog.models import Tag, Post, Category
from config.models import SideBar
from django.views.generic import DetailView, ListView

from comment.forms import CommentForm
from comment.models import Comment

"""
def post_list(request, category_id=None, tag_id=None):
    tag = None
    category = None

    # if tag_id:
    #     try:
    #         tag = Tag.objects.get(id=tag_id)
    #     except Tag.DoesNotExist:
    #         post_list = []
    #     else:
    #         post_list = tag.post_set.filter(status=Post.STATUS_NORMAL)
    # else:
    #     post_list = Post.objects.filter(status=Post.STATUS_NORMAL)
    #     if category_id:
    #         try:
    #             category = Category.objects.get(id=category_id)
    #         except Category.DoesNotExist:
    #             category = None
    #     else:
    #         post_list = post_list.filter(category_id=category_id)
    if tag_id:
        # 选择标签，就按照该标签展示正常状态的文章
        post_list, tag = Post.get_by_tag(tag_id)
    elif category_id:
        # 选择分类，就按照该类展示正常状态的文章
        post_list, category = Post.get_by_category(category_id)
    else:
        # 没有选择标签或分类，就展示全部的正常状态文章
        post_list = Post.latest_posts()
    # shift+tab多行缩进
    # context字典是传递给模板的数据
    context = {
        'category': category,
        'tag': tag,
        'post_list': post_list,
        'sidebar': SideBar.get_all(),
    }
    context.update(Category.get_navs())
    return render(request, 'blog/list.html', context=context)


def post_detail(request, post_id=None):
    try:
        post = Post.objects.get(id=post_id)
    except Post.DoesNotExist:
        post = None

    context = {
        'post': post,
        'sidebar': SideBar.get_all(),
    }
    context.update(Category.get_navs())
    return render(request, 'blog/detail.html', context=context)
"""


# https://docs.djangoproject.com/zh-hans/4.1/topics/class-based-views/
# 通用数据，分类导航、侧边栏、底部导航
class CommonViewMixin:
    def get_context_data(self, **kwargs):
        context = super(CommonViewMixin, self).get_context_data(**kwargs)
        context.update({
            'sidebars': SideBar.get_all(),
        })
        context.update(Category.get_navs())
        return context


# 首页
class IndexView(CommonViewMixin, ListView):
    model = Post
    queryset = Post.latest_posts()
    paginate_by = 5
    context_object_name = 'post_list'
    template_name = 'blog/list.html'


class CategoryView(IndexView):
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        category_id = self.kwargs.get('category_id')
        category = get_object_or_404(Category, pk=category_id)
        context.update({
            'category': category,
        })
        return context

    def get_queryset(self):
        """重写queryset,根据分类过滤"""
        queryset = super().get_queryset()
        category_id = self.kwargs.get('category_id')
        return queryset.filter(category_id=category_id)


class TagView(IndexView):
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        tag_id = self.kwargs.get('tag_id')
        tag = get_object_or_404(Tag, pk=tag_id)
        context.update({
            'tag': tag,
        })
        return context

    def get_queryset(self):
        """重写queryset,根据标签过滤"""
        queryset = super().get_queryset()
        tag_id = self.kwargs.get('tag_id')
        # 此处tag__id为什么用两根下划线，是否是tag为多对多字段？
        return queryset.filter(tag__id=tag_id)


class PostListView(ListView):
    queryset = Post.latest_posts()
    paginate_by = 1  # 每页数量为1
    context_object_name = 'post_list'
    template_name = 'blog/list.html'


class PostDetailView(CommonViewMixin, DetailView):
    # queryset = Post.latest_posts()
    queryset = Post.objects.filter(status=Post.STATUS_NORMAL)
    template_name = 'blog/detail.html'
    context_object_name = 'post'
    pk_url_kwarg = 'post_id'

    def get(self, request, *args,  **kwargs):
        response = super().get(request, *args, **kwargs)
        self.handle_visited()
        return response

    def handle_visited(self):
        increase_pv = False
        increase_uv = False
        uid = self.request.uid
        pv_key = 'pv:%s:%s' % (uid, self.request.path)
        uv_key = 'uv:%s:%s:%s' % (uid, str(date.today()), self.request.path)
        if not cache.get(pv_key):
            increase_pv = True
            cache.set(pv_key, 1, 1*60)  # 1分钟有效

        if not cache.get(uv_key):
            increase_uv = True
            cache.set(pv_key, 1, 24*60*60) # 24小时有效

        if increase_uv and increase_pv:
            Post.objects.filter(pk=self.object.id).update(pv=F('pv') + 1, uv=F('uv') + 1)
        elif increase_pv:
            Post.objects.filter(pk=self.object.id).update(pv=F('pv') + 1)
        elif increase_uv:
            Post.objects.filter(pv=self.object.id).update(uv=F('uv') + 1)

    # def get_context_data(self, **kwargs):
    #     # 重写该函数为了在detail.html中就可以拿到comment_form和comment_list数据
    #     context = super(PostDetailView, self).get_context_data(**kwargs)
    #     context.update({
    #         'comment_form': CommentForm,
    #         'comment_list': Comment.get_by_target(self.request.path),
    #     })
    #     return context


# 搜索功能
class SearchView(IndexView):
    def get_context_data(self):
        context = super(SearchView, self).get_context_data()
        context.update({
            'keyword': self.request.GET.get('keyword', '')
        })
        return context

    def get_queryset(self):
        queryset = super().get_queryset()
        keyword = self.request.GET.get('keyword')
        if not keyword:
            return queryset
        return queryset.filter(Q(title__icontains=keyword) | Q(desc__icontains=keyword))


# 展示指定作者的文章列表
class AuthorView(IndexView):
    def get_queryset(self):
        queryset = super().get_queryset()
        author_id = self.kwargs.get('owner_id')
        return queryset.filter(owner_id=author_id)