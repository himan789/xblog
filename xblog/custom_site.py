from django.contrib.admin import AdminSite


# https://docs.djangoproject.com/zh-hans/4.1/ref/contrib/admin/#django.contrib.admin.AdminSite
class CustomSite(AdminSite):
    site_header = '我的博客'
    site_title = '博客管理后台'
    index_title = '首页'


custom_site = CustomSite(name='cus_admin')
