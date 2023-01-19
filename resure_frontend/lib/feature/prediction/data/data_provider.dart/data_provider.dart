import 'dart:convert';
import 'package:frontend/feature/prediction/model/prediction.dart';
import 'package:http/http.dart' as http;

class PredictionDataProvider {
  @override
  Future<Prediction> create(Prediction prediction) async {
    const url = 'http://127.0.0.1:8000/predict/';
    final http.Response response = await http.post(Uri.parse(url),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode({
          'id':prediction.id,
        'CarName': prediction.CarName,
        'fueltype': prediction.fueltype,
        'aspiration': prediction.aspiration,
        'doornumber': prediction.doornumber,
        'carbody': prediction.carbody,
        'drivewheel': prediction.drivewheel,
        'enginelocation': prediction.enginelocation,
        'enginetype': prediction.enginetype,
        'cylindernumber': prediction.cylindernumber,
        'fuelsystem': prediction.fuelsystem,
        'symboling': prediction.symboling,
        'wheelbase': prediction.wheelbase,
        'carlength': prediction.carlength,
        'carwidth': prediction.carwidth,
        'carheight': prediction.carheight,
        'curbweight': prediction.curbweight,
        'enginesize': prediction.enginesize,
        'boreratio': prediction.boreratio,
        'stroke': prediction.stroke,
        'compressionratio': prediction.compressionratio,
        'horsepower': prediction.horsepower,
        'peakrpm': prediction.peakrpm,
        'citympg': prediction.citympg,
        'highwaympg': prediction.highwaympg,
        }));

    if (response.statusCode == 201) {
      return Prediction.fromJson(jsonDecode(response.body));
    }
    {
      throw Exception(response.body);
    }
  }
}
