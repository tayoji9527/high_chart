// ignore: avoid_web_libraries_in_flutter

import 'dart:html';

import 'package:flutter/material.dart';
import 'package:js/js_util.dart';

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

  dynamic getOption(String key) {
    try {
      return jsify(option[key]);
    } catch (e) {}
  }

  void _onPlatformViewCreated() {
    _highcharts = Highcharts(_element, getOptions(option));
  }

  @override
  Widget build(BuildContext context) {
    return HtmlElementView(
      viewType: _divId,
    );
  }
}

Map get option => {
      'chart': {'type': 'spline'},
      'title': {'text': '风速变化趋势图'},
      'subtitle': {'text': '2009年10月6日和7日两地风速情况'},
      'xAxis': {
        'type': 'datetime',
        'labels': {'overflow': 'justify'}
      },
      'yAxis': {
        'title': {'text': '风 速 (m/s)'},
        'min': 0,
        'minorGridLineWidth': 0,
        'gridLineWidth': 0,
        'alternateGridColor': null,
        'plotBands': [
          {
            'from': 0.3,
            'to': 1.5,
            'color': 'rgba(68, 170, 213, 0.1)',
            'label': {
              'text': '轻空气',
              'style': {'color': '#606060'}
            }
          },
          {
            'from': 1.5,
            'to': 3.3,
            'color': 'rgba(0, 0, 0, 0)',
            'label': {
              'text': '微风',
              'style': {'color': '#606060'}
            }
          },
          {
            'from': 3.3,
            'to': 5.5,
            'color': 'rgba(68, 170, 213, 0.1)',
            'label': {
              'text': '柔和风',
              'style': {'color': '#606060'}
            }
          },
          {
            'from': 5.5,
            'to': 8,
            'color': 'rgba(0, 0, 0, 0)',
            'label': {
              'text': '温和风',
              'style': {'color': '#606060'}
            }
          },
          {
            'from': 8,
            'to': 11,
            'color': 'rgba(68, 170, 213, 0.1)',
            'label': {
              'text': '清新风',
              'style': {'color': '#606060'}
            }
          },
          {
            'from': 11,
            'to': 14,
            'color': 'rgba(0, 0, 0, 0)',
            'label': {
              'text': '强风',
              'style': {'color': '#606060'}
            }
          },
          {
            'from': 14,
            'to': 15,
            'color': 'rgba(68, 170, 213, 0.1)',
            'label': {
              'text': '狂风',
              'style': {'color': '#606060'}
            }
          }
        ]
      },
      'tooltip': {'valueSuffix': ' m/s'},
      'plotOptions': {
        'spline': {
          'lineWidth': 4,
          'states': {
            'hover': {'lineWidth': 5}
          },
          'marker': {'enabled': false},
          'pointInterval': 3600000,
          // 'pointStart': '2009-9-6'
        }
      },
      'series': [
        {
          'name': 'Hestavollane',
          'data': [
            4.3,
            5.1,
            4.3,
            5.2,
            5.4,
            4.7,
            3.5,
            4.1,
            5.6,
            7.4,
            6.9,
            7.1,
            7.9,
            7.9,
            7.5,
            6.7,
            7.7,
            7.7,
            7.4,
            7.0,
            7.1,
            5.8,
            5.9,
            7.4,
            8.2,
            8.5,
            9.4,
            8.1,
            10.9,
            10.4,
            10.9,
            12.4,
            12.1,
            9.5,
            7.5,
            7.1,
            7.5,
            8.1,
            6.8,
            3.4,
            2.1,
            1.9,
            2.8,
            2.9,
            1.3,
            4.4,
            4.2,
            3.0,
            3.0
          ]
        },
        {
          'name': 'Voll',
          'data': [
            0.0,
            0.0,
            0.0,
            0.0,
            0.0,
            0.0,
            0.0,
            0.0,
            0.1,
            0.0,
            0.3,
            0.0,
            0.0,
            0.4,
            0.0,
            0.1,
            0.0,
            0.0,
            0.0,
            0.0,
            0.0,
            0.0,
            0.0,
            0.0,
            0.0,
            0.6,
            1.2,
            1.7,
            0.7,
            2.9,
            4.1,
            2.6,
            3.7,
            3.9,
            1.7,
            2.3,
            3.0,
            3.3,
            4.8,
            5.0,
            4.8,
            5.0,
            3.2,
            2.0,
            0.9,
            0.4,
            0.3,
            0.5,
            0.4
          ]
        }
      ],
      'navigation': {
        'menuItemStyle': {'fontSize': '10px'}
      }
    };
