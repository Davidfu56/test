from django.urls import path,include
from rbac.views import user,organization,menu,role,permission
from rest_framework import routers

router = routers.SimpleRouter()
router.register(r'users', user.UserViewSet, base_name="users")
router.register(r'organizations', organization.OrganizationViewSet, base_name="organization")
router.register(r'menus', menu.MenuViewSet, base_name="menus")
router.register(r'permissions', permission.PermissionViewSet, base_name="permissions")
router.register(r'roles', role.RoleViewSet, base_name="roles")

urlpatterns = [
    path(r'weitest/', include(router.urls)),
    path(r'weitest/login/', user.UserAuthView.as_view()),
    path(r'weitest/userinfo/', user.UserInfoView.as_view(), name='user_info'),
    path(r'weitest/build/menus/', user.UserBuildMenuView.as_view(), name='build_menus'),
    path(r'weitest/organization/tree/', organization.OrganizationTreeView.as_view(),name='organizations_tree'),
    path(r'weitest/organization/user/tree/', organization.OrganizationUserTreeView.as_view(), name='organization_user_tree'),
    path(r'weitest/menu/tree/', menu.MenuTreeView.as_view(), name='menus_tree'),
    path(r'weitest/permission/tree/', permission.PermissionTreeView.as_view(), name='permissions_tree'),
    path(r'weitest/user/list/', user.UserListView.as_view(), name='user_list'),
]
