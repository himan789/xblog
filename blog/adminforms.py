from django import forms
"""
后台管理的Forms，Forms是对用户输入以及Model中要展示数据的抽象
"""


class PostAdminForm(forms.ModelForm):
    desc = forms.CharField(widget=forms.Textarea, label='摘要', required=False)
