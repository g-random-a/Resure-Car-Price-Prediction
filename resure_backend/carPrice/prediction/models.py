from django.db import models

from django.db import models


class CarPrice(models.Model):
    symboling = models.IntegerField(default=2)
    CarName = models.CharField(max_length=50)
    fueltype = models.CharField(max_length=50)
    aspiration = models.CharField(max_length=50)
    doornumber = models.CharField(max_length=50)
    carbody = models.CharField(max_length=50)
    drivewheel = models.CharField(max_length=50)
    enginelocation = models.CharField(max_length=50)
    wheelbase = models.IntegerField(default=111)
    carlength = models.IntegerField(default=132)
    carwidth = models.IntegerField(default=242)
    carheight = models.IntegerField(default=1110)
    curbweight = models.IntegerField(default=1588)
    enginetype = models.CharField(max_length=50)
    cylindernumber = models.CharField(max_length=50)
    enginesize = models.IntegerField(default=150)
    fuelsystem = models.CharField(max_length=50)
    boreratio = models.IntegerField(default=0)
    stroke = models.FloatField(default=1)
    compressionratio = models.IntegerField(default=111)
    horsepower = models.IntegerField(default=1)
    peakrpm = models.IntegerField(default=1)
    citympg = models.IntegerField(default=21)
    highwaympg = models.IntegerField(default=1)

