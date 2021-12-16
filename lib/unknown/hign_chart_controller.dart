import 'package:flutter/material.dart';
import 'package:high_chart/hign_charts.dart';

class HignChartController extends ChangeNotifier {
  Map? options;
  HignChartsType chartsType = HignChartsType.chart;
  dynamic init({dynamic data}) {}

  Future<void> setOptions(Map options) async {}
  Future<void> setData(int index, dynamic data) async {}
  Future<void> reset() async {}
}
