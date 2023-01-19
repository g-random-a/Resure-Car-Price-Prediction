from rest_framework import serializers
from ..models import CarPrice


class CarSerializers(serializers.ModelSerializer):
    class Meta:
        model = CarPrice
        exclude = []
