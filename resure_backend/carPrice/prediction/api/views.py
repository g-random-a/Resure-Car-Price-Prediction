import pandas as pd
from rest_framework import generics
from rest_framework.decorators import api_view
from prediction.api.serielizers import CarSerializers
from ..models import CarPrice
import numpy as np
from django.http import JsonResponse
import pickle
import os
from carPrice.settings import BASE_DIR

filename = os.path.join(BASE_DIR, 'prediction\prediction_model\\finalized_model2.pkl')


class CarGet(generics.ListAPIView):
    queryset = CarPrice.objects.all()
    serializer_class = CarSerializers


@api_view(["POST", ])
def CarList(request):
    with open(filename, 'rb') as file:
        mdl = pickle.load(file)
    mydata = request.data
    dd = pd.DataFrame(mydata,index=[0])
    # print(mydata)
    # unit = np.array(list(mydata.values()))
    # unit = unit.reshape(1, -1)
    # print(unit)
    y_pred = mdl.predict(dd)
    # ans = 'Positive' if y_pred[0] else 'Negative'
    # print(ans)
    return JsonResponse(y_pred[0]*100, safe=False)
