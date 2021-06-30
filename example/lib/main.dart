import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:high_chart/high_chart.dart';

void main() {
  FlutterError.onError = (err) async {};
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
  }

  List data = [5, 3, 3, 1, 6];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('High Chart Example App'),
        ),
        body: ListView(
          children: [
            Container(
              height: 300,
              child: HighCharts(
                isStock: false,
                onLoad: (isLoadStop) {
                  print(isLoadStop);
                },
                data: aaa,
              ),
            ),
            CupertinoButton(
                child: Text("data"),
                onPressed: () {
                  final a = Random();
                  data = [
                    a.nextInt(10),
                    a.nextInt(10),
                    a.nextInt(10),
                    a.nextInt(10),
                    a.nextInt(10)
                  ];
                  print(data);
                  setState(() {
                    // controller.upDate(_chart_data);
                  });
                })
          ],
        ),
      ),
    );
  }

  String get aaa => ''' {
	chart : {
		events : {
			load : function () {
				// set up the updating of the chart each second
				var series = this.series[0];
				setInterval(function () {
					var x = (new Date()).getTime(), // current time
						y = Math.round(Math.random() * 100);
					series.addPoint([x, y], true, true);
				}, 1000);
			}
		}
	},
	rangeSelector: {
		buttons: [{
			count: 1,
			type: 'minute',
			text: '1M'
		}, {
			count: 5,
			type: 'minute',
			text: '5M'
		}, {
			type: 'all',
			text: 'All'
		}],
		inputEnabled: false,
		selected: 0
	},
	title : {
		text : 'Live random data'
	},
	tooltip: {
		split: false
	},
	exporting: {
		enabled: false
	},
	series : [{
		name : '随机数据',
		data : (function () {
			// generate an array of random data
			var data = [], time = (new Date()).getTime(), i;
			for (i = -50; i <= 0; i += 1) {
				data.push([
					time + i * 1000,
					Math.round(Math.random() * 100)
				]);
			}
			return data;
		}())
	}]
}''';
}
