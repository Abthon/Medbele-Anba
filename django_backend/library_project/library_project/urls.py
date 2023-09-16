from django.contrib import admin
from django.urls import path, include
# project/urls.py (or the main project-level URL configuration file)
from django.conf import settings
from django.conf.urls.static import static


handler404 = 'library_app.api.views.handler404'

urlpatterns = [
    path('admin/', admin.site.urls), 
    path('', include('library_app.api.urls'))
]


if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
