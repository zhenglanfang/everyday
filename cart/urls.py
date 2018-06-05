
from django.conf.urls import url
from cart import views

urlpatterns = [
    url(r'^$',views.cart,name='carts'),
    url(r'^update/(\d+)/$',views.update_cart,name='update'),
    url(r'^delete/(\d+)/$',views.delete_cart,name='delete'),
    url(r'^add/(\d+)/$',views.add_cart,name='add'),
]