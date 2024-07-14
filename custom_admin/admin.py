# my_app/admin.py
from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from django.utils.translation import gettext_lazy as _
from user.models import CustomUser

admin.site.site_header = "Infinite Dream"
admin.site.site_title = _("Admin Portal")
admin.site.index_title = _("Welcome to Infinite Dream Portal")


class CustomUserAdmin(UserAdmin):
    model = CustomUser
    list_display = ('email', 'first_name', 'last_name', 'role', 'birthday', 'is_staff', 'is_active')
    list_filter = ('is_staff', 'is_active', 'role')
    
    fieldsets = (
        (None, {'fields': ('email', 'password')}),
        (_('Personal info'), {'fields': ('first_name', 'last_name', 'role', 'birthday')}),
        (_('Permissions'), {'fields': ('is_staff', 'is_active', 'is_superuser', 'groups', 'user_permissions')}),
        (_('Important dates'), {'fields': ('last_login',)}),
    )
    
    add_fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': ('email', 'first_name', 'last_name', 'role', 'birthday', 'password1', 'password2', 'is_staff', 'is_active')}
        ),
    )
    
    search_fields = ('email', 'first_name', 'last_name', 'role')
    ordering = ('email',)

admin.site.register(CustomUser, CustomUserAdmin)


 

