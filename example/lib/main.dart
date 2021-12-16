import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:async';

import 'package:high_chart/hign_charts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  HignChartController? controller;
  var is1 = true;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                height: 500,
                child: HignCharts(
                  onLoad: (controller) => this.controller = controller,
                  chartsType:
                      false ? HignChartsType.chart : HignChartsType.stockChart,
                  options: false ? option : option1,
                ),
              ),
              CupertinoButton(
                  child: Text('change'),
                  onPressed: () {
                    final rad = Random();
                    controller?.setData(0, [
                      rad.nextInt(119931),
                      rad.nextInt(119931),
                      rad.nextInt(119931),
                      rad.nextInt(119931),
                      rad.nextInt(119931),
                      rad.nextInt(119931),
                      rad.nextInt(119931),
                      rad.nextInt(119931),
                    ]);
                  }),
              CupertinoButton(
                  child: Text('option'),
                  onPressed: () {
                    is1 = !is1;
                    setState(() {});
                  }),
              CupertinoButton(
                  child: Text('option'),
                  onPressed: () {
                    controller?.reset();
                    setState(() {});
                  })
            ],
          ),
        ),
      ),
    );
  }
}

Map option = {
  'title': {'text': 'option -2010 ~ 2016 年太阳能行业就业人员发展情况'},
  'subtitle': {'text': '数据来源：thesolarfoundation.com'},
  'yAxis': {
    'title': {'text': '就业人数'}
  },
  'legend': {'layout': 'vertical', 'align': 'right', 'verticalAlign': 'middle'},
  'plotOptions': {
    'series': {
      'label': {'connectorAllowed': false},
      'pointStart': 2010
    }
  },
  'series': [
    {
      'name': '安装，实施人员',
      'data': [43934, 5253, 57177, 69658, 97031, 11931, 137133, 154175]
    },
    {
      'name': '工人',
      'data': [24916, 24064, 2942, 29851, 3290, 30282, 38121, 40434]
    },
    {
      'name': '销售',
      'data': [11744, 17722, 16005, 1971, 20185, 24377, 32147, 39387]
    },
    {
      'name': '项目开发',
      'data': [null, null, 7988, 12169, 15112, 22452, 34400, 34227]
    },
    {
      'name': '其他',
      'data': [12908, 5948, 8105, 1148, 8989, 211816, 18274, 18111]
    }
  ],
  'responsive': {
    'rules': [
      {
        'condition': {'maxWidth': 500},
        'chartOptions': {
          'legend': {
            'layout': 'horizontal',
            'align': 'center',
            'verticalAlign': 'bottom'
          }
        }
      }
    ]
  }
};

Map option1 = {
  "extension": {"layout": "single", "height": 600, "col": 4},
  "title": {
    "text": "今日持仓数",
    "style": {"color": "#323f4b", "fontSize": 16.0}
  },
  "xAxis": {
    "type": "datetime",
    "labels": {
      "style": {"color": "#9aa5b1", "fontSize": 12.0}
    }
  },
  "series": [
    {
      "name": "positions",
      "color": "#0000FF",
      "data": [
        [1639578904523.2249, 2],
        [1639578905500.9792, 2],
        [1639578906463.9377, 2],
        [1639578907397.018, 2],
      ]
    }
  ],
  "chart": {
    "spacingTop": 5.0,
    "spacingLeft": 0.0,
    "spacingRight": 15.0,
    "spacingBottom": 10.0,
    "backgroundColor": "rgba(0,0,0,0)"
  },
  "yAxis": {
    "labels": {
      "style": {"color": "#9aa5b1", "fontSize": 12.0}
    }
  }
};
