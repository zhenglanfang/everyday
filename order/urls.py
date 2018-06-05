from django.conf.urls import url
from order import views

urlpatterns = [
    url(r'^$',views.order,name='user_order'),
    url(r'^submit_order/$', views.submit_order, name='submit_order'),
    url(r'^add_order/$',views.add_order,name='add_order'),
    url(r'^play/(\d+)/$',views.play,name='play'),
    url(r'^play_handle/$',views.play_handle,name='play_handel'),
]
