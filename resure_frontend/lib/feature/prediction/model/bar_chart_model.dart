import 'package:charts_flutter/flutter.dart' as charts;

class BarChartModel {
  String model;
  int accuracy;
  final charts.Color color;

  BarChartModel({
    required this.model,
    required this.accuracy,
    required this.color,
  });
}