// ignore: avoid_web_libraries_in_flutter
import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';

import 'package:flutter/scheduler.dart';
import 'package:high_chart/hign_chart.dart';
import 'dart:ui' as ui;

import 'package:high_chart/web/hign_chart_js.dart';

class HignChartState extends State<HignChart> {
  late DivElement _element;
  late String _divId;
  late Highcharts _highcharts;

  @override
  void initState() {
    super.initState();
    _divId = this.hashCode.toString();

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(_divId, (int viewId) {
      _element = DivElement()
        ..id = _divId
        ..style.width = '100%'
        ..style.height = '100%'
        ..style.margin = '0';
      return _element;
    });
    SchedulerBinding.instance?.addPostFrameCallback((_) {
      _onPlatformViewCreated();
    });
  }

  void _onPlatformViewCreated() {
    _highcharts =
        Highcharts(_element, MapOptions(title: MapTitle(text: 'asd')));
  }

  @override
  Widget build(BuildContext context) {
    return HtmlElementView(
      viewType: _divId,
    );
  }
}
