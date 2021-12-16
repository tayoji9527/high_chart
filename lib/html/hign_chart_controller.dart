import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:high_chart/hign_charts.dart';
import 'package:js/js_util.dart';
import 'hign_chart.dart';
import 'dart:ui' as ui;

class HignChartController extends ChangeNotifier {
  HtmlCharts? htmlCharts;
  Map? options;
  late DivElement element;
  HignChartsType chartsType = HignChartsType.chart;

  dynamic init({dynamic data}) async {
    final id = this.hashCode.toString();
    // ignore: undefined_prefixed_name
    await ui.platformViewRegistry.registerViewFactory(id, (int viewId) {
      element = DivElement()
        ..id = id
        ..style.width = '100%'
        ..style.height = '100%'
        ..style.margin = '0';
      return element;
    });
    SchedulerBinding.instance?.addPostFrameCallback((_) async {
      await reset();
      (data ?? (dynamic) {})(this);
    });
  }

  Future<void> setOptions(Map option) async {}
  Future<void> setData(int index, dynamic data) async {
    try {
      htmlCharts?.series[index].setData(jsify(data));
      options?['series'][index]['data'] = data;
    } catch (e) {
      print(e);
    }
  }

  Future<void> reset() async {
    htmlCharts = chartsType == HignChartsType.chart
        ? Highcharts(element, getOptions(options ?? {}))
        : Highstocks(element, getOptions(options ?? {}));
  }
}
