from django.urls import path

from prediction.api.views import CarList,CarGet

urlpatterns = [
    path('predict/',CarList, name = 'car-list'),
    path('view/',CarGet.as_view(), name = 'Car-get'),
]

