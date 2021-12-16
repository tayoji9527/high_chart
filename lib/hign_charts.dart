import 'package:flutter/material.dart';

import 'hign_chart.dart'
    if (dart.library.html) 'html/hign_chart.dart'
    if (dart.library.io) 'io/hign_chart.dart';

class HignChart extends StatefulWidget {
  final String option;
  final bool isStock;
  final List<List> data;
  final bool resetZoom;
  final Map? options;

  HignChart(
      {required this.option,
      required this.data,
      this.isStock = true,
      this.options,
      this.resetZoom = false});
  @override
  State<HignChart> createState() {
    return HignChartState();
  }
}
