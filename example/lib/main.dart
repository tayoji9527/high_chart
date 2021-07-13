import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:high_chart/high_chart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
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
                child: HignChart(
                  data: data,
                  option: option,
                ),
              ),
              CupertinoButton(
                  child: Text('zzzzz'),
                  onPressed: () {
                    setState(() {});
                  })
            ],
          ),
        ),
      ),
    );
  }

  List<List> get data {
    var i = 0;
    return [
      [
        '''{
          "close": 5432,
          "high": 5433.000000000001,
          "low": 5428,
          "open": 5430,
          "tips":
              "\u003cb\u003e◉ 9805\u003c/b\u003e\u003cbr\u003e5433 → 0000 ▲ 0046\u003cbr\u003e5432 → 0000 ▲ 0039\u003cbr\u003e5432 → 0059 ▲ 0415\u003cbr\u003e5431 → 0000 ▲ 0335\u003cbr\u003e5431 → 0555 ▲ 1845\u003cbr\u003e5430 → 0541 ▼ 0305\u003cbr\u003e5430 → 2470 ▼ 1366\u003cbr\u003e5429 → 0129 ▲ 0265\u003cbr\u003e5429 → 0429 ▲ 0714\u003cbr\u003e5428 → 0292 ▼ 0000\u003cbr\u003e\u003cb\u003e⊗ 855\u003c/b\u003e",
          "x": 1626073140000
        }'''
      ]
    ];
  }

  String get option => ''' {
		"chart": {
			"zoomType": "x",
			"backgroundColor": "rgba(0,0,0,0)",
			"borderRadius": 5,
			"panKey": "shift",
			"animation": false,
			"spacingTop": 5,
			"spacingLeft": 0,
			"spacingRight": 0,
			"spacingBottom": 10
		},
		"plotOptions": {
			"candlestick": {
				"color": "#00F0F0",
				"lineColor": "#00F0F0",
				"upColor": "#272822",
				"upLineColor": "#FF3C3C"
			}
		},
		"tooltip": {
			"xDateFormat": "%Y-%m-%d %H:%M:%S, %A",
			"pointFormat": "{point.tips}",
			"borderColor": "rgb(58, 68, 83)",
			"borderRadius": 0
		},
		"series": [
			{
				"name": "Futures_CTP",
				"type": "candlestick",
				"data": []
			}
		],
		"yAxis": {
			"gridLineColor": "red",
			"gridLineDashStyle": "Dot",
			"labels": {
				"style": {
					"color": "#9aa5b1",
					"fontSize": 12
				}
			},
			"opposite": true
		},
		"rangeSelector": {
			"enabled": false,
			"selected": 3
		},
		"navigation": {
			"buttonOptions": {
				"height": 28,
				"width": 33,
				"symbolSize": 18,
				"symbolX": 17,
				"symbolY": 14,
				"symbolStrokeWidth": 2
			}
		},
		"lang": {
			"contextButtonTitle": "图表导出菜单",
			"decimalPoint": ".",
			"downloadJPEG": "下载JPEG图片",
			"downloadPDF": "下载PDF文件",
			"downloadPNG": "下载PNG文件",
			"downloadSVG": "下载SVG文件",
			"drillUpText": "返回 {series.name}",
			"loading": "加载中",
			"months": [
				"一月",
				"二月",
				"三月",
				"四月",
				"五月",
				"六月",
				"七月",
				"八月",
				"九月",
				"十月",
				"十一月",
				"十二月"
			],
			"shortMonths": [
				"一月",
				"二月",
				"三月",
				"四月",
				"五月",
				"六月",
				"七月",
				"八月",
				"九月",
				"十月",
				"十一月",
				"十二月"
			],
			"noData": "没有数据",
			"printChart": "打印图表",
			"resetZoom": "恢复缩放",
			"resetZoomTitle": "恢复图表",
			"weekdays": [
				"星期天",
				"星期一",
				"星期二",
				"星期三",
				"星期四",
				"星期五",
				"星期六"
			]
		}
	}''';
}
