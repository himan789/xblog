from django.urls import reverse
from django.contrib import admin
from .models import Post, Category, Tag
from django.utils.html import format_html
from .adminforms import PostAdminForm
from xblog.custom_site import custom_site
from xblog.base_admin import BaseOwnerAdmin
from django.contrib.admin.models import LogEntry


# Register your models here.
# https://docs.djangoproject.com/zh-hans/4.1/ref/contrib/admin/#modeladmin-objects

# 分类界面直接编辑文章


class PostInline(admin.StackedInline):  # 可选择继承自admin.StackedInline,以获取不同的展示样式
    model = Post
    fields = ('title', 'desc')
    extra = 1  # 每次进入可以增加多少个


# @admin.register(Category)
# class CategoryAdmin(admin.ModelAdmin):
@admin.register(Category, site=custom_site)
class CategoryAdmin(BaseOwnerAdmin):
    """https://docs.djangoproject.com/zh-hans/4.1/ref/contrib/admin/#modeladmin-objects"""
    inlines = [PostInline, ]  # 分类页面编辑文章
    list_display = ('name', 'status', 'is_nav', 'created_time', 'post_count')
    fields = ('name', 'status', 'is_nav')

    def post_count(self, obj):
        return obj.post_set.count()

    post_count.short_description = '文章数量'

    # 用基类BaseOwnerAdmin来保存当前的作者owner,保证代码的简洁性和良好的维护
    # def save_model(self, request, obj, form, change):
    #     """定义该方法的作用：把当前登录用户设定为作者
    #          request.user即当前登录的用户
    #          obj就是当前要保存的对象
    #          form是页面提交来的表单后的对象
    #          change标志本次保存的数据是新增还是更新的
    #          """
    #     obj.owner = request.user
    #     return super(CategoryAdmin, self).save_model(request, obj, form, change)


# @admin.register(Tag)
# class TagAdmin(admin.ModelAdmin):
@admin.register(Tag, site=custom_site)
class TagAdmin(BaseOwnerAdmin):
    # list_display就是点开标签栏里面的展示内容
    list_display = ('name', 'status', 'created_time')
    # fields是点开标签栏后的+增加所要显示的内容,也可以调整展示字段的顺序
    fields = ('name', 'status')

    # def save_model(self, request, obj, form, change):
    #     obj.owner = request.user
    #     return super().save_model(request, obj, form, change)#super()是个类


class CategoryOwnerFilter(admin.SimpleListFilter):
    """ 自定义过滤器只展示当前用户分类
    https://docs.djangoproject.com/zh-hans/4.1/ref/contrib/admin/filters/#using-a-simplelistfilter
    """
    title = '分类过滤器'
    parameter_name = 'owner_category'

    def lookups(self, request, model_admin):
        # 返回要展示的内容和查询的id
        return Category.objects.filter(owner=request.user).values_list('id', 'name')

    def queryset(self, request, queryset):
        # 只展示当前用户的数据，根据URL Query的内容返回列表页数据
        category_id = self.value()
        if category_id:
            return queryset.filter(category_id=self.value())
        return queryset


# @admin.register(Post)
# class PostAdmin(admin.ModelAdmin):
@admin.register(Post, site=custom_site)
class PostAdmin(BaseOwnerAdmin):
    # 摘要改为Textarea
    form = PostAdminForm
    # 配置列表页面展示哪些字段
    list_display = [
        'title', 'category', 'status',
        'created_time', 'owner', 'operator'
    ]
    # 点击进入编辑页面
    list_display_links = []
    # 配置字段来过滤列表页
    # list_filter = ['category']
    list_filter = [CategoryOwnerFilter, ]
    # 配置搜索字段 列表页上方的搜索栏可以搜索的内容
    search_fields = ['title', 'category__name']
    # 动作相关的配置，是否展示在顶部
    actions_on_top = True
    # 动作相关的配置，是否展示在底部
    actions_on_bottom = True

    # 编辑页面
    # 保存、编辑、编辑并新建按钮是否在顶部展示
    save_on_top = True
    exclude = ['owner']
    """
    fields = (
        ('category', 'title'),
        'desc',
        'status',
        'content',
        'tag',
    )
    """
    # fieldsets可控制页面布局
    fieldsets = (
        ('基础配置', {
            'description': '基础配置描述',
            'fields': (
                ('title', 'category'),
                'status',
            ),
        }),
        ('内容', {
            'fields': (
                'desc',
                'content',
            ),
        }),
        ('额外信息', {
            'classes': ('wide',),  # classes:一个包含额外 CSS 类的列表或元组，用于应用到字段集。
            'fields': ('tag',),
            # 默认的管理网站样式表定义的两个有用的类是 collapse 和 wide。collapse 风格的字段集将在管理中被初始折叠，并被一个小的 “点击展开” 链接所取代；wide 风格的字段集将被赋予额外的水平空间。wide 风格的字段集将获得额外的水平空间。
        })
    )
    # https://docs.djangoproject.com/zh-hans/4.1/ref/contrib/admin/#django.contrib.admin.ModelAdmin.fieldsets
    filter_horizontal = ('tag', )
    # tags是横行还是纵向展示
    #filter_vertical = ('tag',)

    def operator(self, obj):
        # 操作
        # 在列表页展示自定义的字段
        return format_html('<a href="{}">编辑</a>',
                           reverse('cus_admin:blog_post_change', args=(obj.id,))
                           )  # 返回HTML，reverse进行解析URL地址

    operator.short_description = '操作'  # 表头展示的文案

    """
    def save_model(self, request, obj, form, change):
        obj.owner = request.user
        return super(PostAdmin, self).save_model(request, obj, form, change)

    def get_queryset(self, request):
        # 当前登录用户只能查看自己创建的文章
        qs = super(PostAdmin, self).get_queryset(request)
        return qs.filter(owner=request.user)
    """

    class Media:
        # https://docs.djangoproject.com/zh-hans/4.1/topics/forms/media/
        # 自定义静态文件资源引入
        css = {
            'all': ("https://cdn.bootcss.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css",),
        }
        js = ('https://cdn.bootcss.com/bootstrap/4.0.0-beta.2/js/bootstrap.bundle.js',)


@admin.register(LogEntry, site=custom_site)
class LogEntryAdmin(admin.ModelAdmin):
    list_display = ['object_repr', 'object_id', 'action_flag', 'user', 'change_message']
