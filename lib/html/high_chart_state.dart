// ignore: avoid_web_libraries_in_flutter
import 'dart:html' show DivElement;
import 'dart:js_util';

import 'package:flutter/material.dart';

import 'package:flutter/scheduler.dart';
import 'package:high_chart/hign_charts.dart';
import 'hign_chart.dart';

class HignChartState extends State<HignCharts> {
  final HignChartController controller = HignChartController();

  @override
  void initState() {
    super.initState();

    controller.options = widget.options;
    controller.chartsType = widget.chartsType;
    controller.init(data: widget.onLoad);
  }

  @override
  void didUpdateWidget(covariant HignCharts oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (controller.options.hashCode != widget.options.hashCode) {
      controller.options = widget.options;
      controller.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return HtmlElementView(
      viewType: controller.hashCode.toString(),
    );
  }
}
