from django.conf.urls import url
from goods import views

urlpatterns = [
    url(r'^list/(\d+)/(\d+)/$',views.list,name='list'),
    url(r'^detail/(\d+)/$',views.detail,name='detail'),
    url(r'^search/$',views.search,name='search'),
]
