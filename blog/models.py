from functools import cached_property

import mistune
from django.contrib.auth.models import User
from django.db import models


# Create your models here.

# 分类：名称、状态、作者、创建时间、是否置顶导航
class Category(models.Model):
    STATUS_NORMAL = 1
    STATUS_DELETE = 0
    STATUS_ITEMS = (
        (STATUS_NORMAL, '正常'),
        (STATUS_DELETE, '删除'),
    )

    name = models.CharField(max_length=50, verbose_name="名称")
    status = models.PositiveIntegerField(default=STATUS_NORMAL, choices=STATUS_ITEMS,
                                         verbose_name="状态")
    is_nav = models.BooleanField(default=False, verbose_name="是否为导航")
    owner = models.ForeignKey(User, verbose_name="作者", on_delete=models.CASCADE)
    created_time = models.DateTimeField(auto_now_add=True, verbose_name="创建时间")

    class Meta:
        verbose_name = verbose_name_plural = '分类'

    def __str__(self):
        # 文章列表的分类显示，若没有这个__str__方法显示的是Category object
        return self.name

    @classmethod
    def get_navs(cls):
        # 获取所有分类，并区分是否导航
        categories = cls.objects.filter(status=cls.STATUS_NORMAL)
        nav_categories = []
        normal_categories = []
        for cate in categories:
            if cate.is_nav:
                nav_categories.append(cate)
            else:
                normal_categories.append(cate)
        return {
            'navs': nav_categories,
            'categories': normal_categories,
        }


# 标签：名称、状态、作者、创建时间
class Tag(models.Model):
    STATUS_NORMAL = 1
    STATUS_DELETE = 0
    STATUS_ITEMS = (
        (STATUS_NORMAL, '正常'),
        (STATUS_DELETE, '删除'),
    )

    name = models.CharField(max_length=10, verbose_name="名称")
    status = models.PositiveIntegerField(default=STATUS_NORMAL, choices=STATUS_ITEMS,
                                         verbose_name="状态")
    owner = models.ForeignKey(User, verbose_name="作者", on_delete=models.CASCADE)
    created_time = models.DateTimeField(auto_now_add=True, verbose_name="创建时间")

    class Meta:
        verbose_name = verbose_name_plural = '标签'

    def __str__(self):
        return self.name


# 文章：标题、摘要、正文、状态、分类（多对一）、标签（多对多）、作者、创建时间
class Post(models.Model):
    STATUS_NORMAL = 1
    STATUS_DELETE = 0
    STATUS_DRAFT = 2
    STATUS_ITEMS = (
        (STATUS_NORMAL, '正常'),
        (STATUS_DELETE, '删除'),
        (STATUS_DRAFT, '草稿'),
    )

    title = models.CharField(max_length=255, verbose_name='标题')
    desc = models.CharField(max_length=1024, blank=True, verbose_name="摘要")
    #desc = models.TextField(verbose_name="摘要",)
    content = models.TextField(verbose_name="正文", help_text="正文必须为MarkDown格式")
    status = models.PositiveIntegerField(default=STATUS_NORMAL, choices=STATUS_ITEMS,
                                         verbose_name="状态")
    category = models.ForeignKey(Category, verbose_name="分类", on_delete=models.CASCADE)
    tag = models.ManyToManyField(Tag, verbose_name="标签")
    owner = models.ForeignKey(User, verbose_name="作者", on_delete=models.CASCADE)
    created_time = models.DateTimeField(auto_now_add=True, verbose_name="创建时间")
    pv = models.PositiveIntegerField(default=1)  # 每篇文章的访问量
    uv = models.PositiveIntegerField(default=1)
    content_html = models.TextField(verbose_name='正文html代码', blank=True, editable=False)

    class Meta:
        verbose_name = verbose_name_plural = '文章'
        ordering = ['-id']   # 根据id进行降序排列

    def __str__(self):
        return self.title

    def save(self, *args, **kwargs):
        self.content_html = mistune.Markdown(self.content)
        super().save(*args, **kwargs)
    @staticmethod
    def get_by_tag(tag_id):
        try:
            tag = Tag.objects.get(id=tag_id)
        except Tag.DoesNotExist:
            tag = None
            post_list = []
        else:
            # post_set是什么
            post_list = tag.post_set.filter(status=Post.STATUS_NORMAL).select_related('owner', 'category')
        return post_list, tag

    @staticmethod
    def get_by_category(category_id):
        try:
            category = Category.objects.get(id=category_id)
        except Category.DoesNotExist:
            category = None
            post_list = []
        else:
            post_list = category.post_set.filter(status=Post.STATUS_NORMAL).select_related('owner', 'category')
        return post_list, category

    @classmethod
    def latest_posts(cls):
        # 这又是个什么鬼
        # 在没有选择标签和分类时，就选择正常状态的文章
        queryset = cls.objects.filter(status=cls.STATUS_NORMAL)

    @classmethod
    def hot_posts(cls):
        # 按照篇访问量排序
        return cls.objects.filter(status=cls.STATUS_NORMAL).order_by('-pv')

    # 把返回的数据绑到实例上
    @cached_property
    def tags(self):
        # 输出配置好的tags
        return ','.join(self.tag.values_list('name', flat=True))