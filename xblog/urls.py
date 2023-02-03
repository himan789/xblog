"""typeidea URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, re_path
from blog.views import IndexView, PostDetailView, CategoryView, TagView
from .custom_site import custom_site
from blog.views import SearchView

from blog.views import AuthorView

from config.views import LinkListView

from comment.views import CommentView

# from blog.rss import LatestPostFeed

urlpatterns = [
    # path('', post_list, name='index'),
    # # path('category/<int:category_id>', post_list, name='category-list'),
    # re_path(r'^category/(?P<category_id>\d+)/$', post_list, name='category-list'),
    # path('tag/<int:tag_id>', post_list, name='tag-list'),
    # # path('post/<int:post_id>', post_detail, name='post-detail'),
    # # Post.objects.filter(pk=pk)过滤Post数据的参数，拿到指定文章的实例
    # re_path(r'^post/(?P<pk>\d+.html$', PostDetailView.as_view(), name='post-detail'),
    # path('links/', links, name='links'),
    path('super_admin/', admin.site.urls, name='super-admin'),
    path('admin', custom_site.urls, name='admin'),
    path('', IndexView.as_view(), name='index'),
    re_path(r'^category/(?P<category_id>\d+)/$', CategoryView.as_view(), name='category-list'),
    re_path(r'^tag/(?P<tag_id>\d+)/$', TagView.as_view(), name='tag-list'),
    re_path(r'^post/(?P<post_id>\d+)/$', PostDetailView.as_view(), name='post-detail'),
    # path('post/<int:post_id>', PostDetailView.as_view(), name='post-detail'),
    re_path(r'^search/$', SearchView.as_view(), name='search'),
    re_path(r'^author/(?P<owner_id>\d+)/$', AuthorView.as_view(), name='author'),
    path('links/', LinkListView.as_view(), name='links'),
    path('comment/', CommentView.as_view(), name='comment'),
    # path('rss|feed', LatestPostFeed(), name='rss')
    # path('admin', admin.site.urls),
]
