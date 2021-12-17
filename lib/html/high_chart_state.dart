import 'dart:html' show DivElement;
import 'dart:js_util';

import 'package:flutter/material.dart';

import 'package:high_chart/hign_charts.dart';

class HignChartState extends State<HignCharts> {
  var isLoadstop = false;
  final HignChartController controller = HignChartController();

  @override
  void initState() {
    super.initState();

    controller.options = widget.options;
    controller.chartsType = widget.chartsType;
    controller.init(data: [widget.onLoad, setLoadstop]);
  }

  setLoadstop() {
    isLoadstop = true;
  }

  @override
  void didUpdateWidget(covariant HignCharts oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (isLoadstop) {
      (widget.onUpdate ?? (dynamic) {})(this.controller);
    }
  }

  @override
  Widget build(BuildContext context) {
    return HtmlElementView(
      viewType: controller.hashCode.toString(),
    );
  }
}
