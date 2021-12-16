import 'package:flutter/material.dart';
import 'package:high_chart/hign_charts.dart';

class HignCharts extends StatefulWidget {
  final HignChartsType chartsType;
  final Function(HignChartController controller)? onLoad;

  final Map options;
  HignCharts(
      {required this.options,
      this.chartsType = HignChartsType.chart,
      this.onLoad});
  @override
  State<HignCharts> createState() {
    return HignChartState();
  }
}
