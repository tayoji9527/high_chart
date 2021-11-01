import 'package:flutter/material.dart';

import 'high_chart_state.dart'
    if (dart.library.html) 'web/high_chart_state.dart'
    if (dart.library.io) 'mobile/high_chart_state.dart';

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
