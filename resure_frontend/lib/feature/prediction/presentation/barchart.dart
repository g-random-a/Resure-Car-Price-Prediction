import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

import '../model/bar_chart_model.dart';


class BarChart extends StatelessWidget {
  BarChart({Key? key}) : super(key: key);
  final List<BarChartModel> data = [
    BarChartModel(
      model: "Linear Regression",
      accuracy: 40,
      color: charts.ColorUtil.fromDartColor(Colors.blueGrey),
    ),
    BarChartModel(
      model: "Random Forest",
      accuracy: 92,
      color: charts.ColorUtil.fromDartColor(Colors.red),
    ),
    BarChartModel(
      model: "Hist Gradient",
      accuracy: 88,
      color: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    // BarChartModel(
    //   year: "2017",
    //   financial: 450,
    //   color: charts.ColorUtil.fromDartColor(Colors.yellow),
    // ),
    // BarChartModel(
    //   year: "2018",
    //   financial: 630,
    //   color: charts.ColorUtil.fromDartColor(Colors.lightBlueAccent),
    // ),
    // BarChartModel(
    //   year: "2019",
    //   financial: 950,
    //   color: charts.ColorUtil.fromDartColor(Colors.pink),
    // ),
    // BarChartModel(
    //   year: "2020",
    //   financial: 400,
    //   color: charts.ColorUtil.fromDartColor(Colors.purple),
    // ),
  ];

  @override
  Widget build(BuildContext context) {
    List<charts.Series<BarChartModel, String>> series = [
      charts.Series(
        id: "financial",
        data: data,
        domainFn: (BarChartModel series, _) => series.model,
        measureFn: (BarChartModel series, _) => series.accuracy,
        colorFn: (BarChartModel series, _) => series.color,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Performance Analysis of Models"),
        centerTitle: true,
        backgroundColor: Colors.blue[700],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        child: charts.BarChart(
          series,
          animate: true,
        ),
      ),
    );
  }
}