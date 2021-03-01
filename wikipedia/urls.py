from django.contrib import admin
from django.urls import path
from wikipedia import views

urlpatterns = [
   path('',views.index,name='index'),
   path('index/',views.index,name='index'),
   #path('index/',views.index),
   path('login/',views.login),
  
   path('aboutus/',views.aboutus),
   path('contact/',views.contact),
   path('feedbackpage/',views.feedbackpage,name='feedbackpage'),
   path('viewregi/',views.viewregi,name='viewregi'),
   path('update/<int:id>',views.update,name='update'),
   path('delete/<int:id>',views.delete),
   path('deletefeed/<int:id>',views.deletefeed),
   path('upload1/',views.upload1),
   path('home/',views.home,name='home'),
   path('viewfeed/',views.viewfeed,name='viewfeed'),
   path('logoutform/',views.logoutform,name='logoutform'),
   path('updateprofile/',views.updateprofile,name='updateprofile'),
   path('viewfile/',views.viewfile,name='viewfile'),
   path('deletefile/<int:id>',views.deletefile),
   
]