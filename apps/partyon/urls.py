__author__ = 'denise'

from django.conf.urls import patterns, url

from apps.partyon import views

urlpatterns = patterns('',
    url(r'^$', views.index, name='index'),
    url(r'plan$', views.plan, name='plan')
)
