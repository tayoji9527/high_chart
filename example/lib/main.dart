import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  }

  List data = [5, 3, 3, 1, 6];
  HighChartsController controller = HighChartsController();

  String get _chart_data => '''{
      title: {
          text: 'Combination chart'
      },
      xAxis: {
          categories: ['Apples', 'Oranges', 'Pears', 'Bananas', 'Plums']
      },
      labels: {
          items: [{
              html: 'Total fruit consumption',
              style: {
                  left: '50px',
                  top: '18px',
                  color: ( // theme
                      Highcharts.defaultOptions.title.style &&
                      Highcharts.defaultOptions.title.style.color
                  ) || 'black'
              }
          }]
      },
      series: [{
          type: 'column',
          name: 'Jane',
          data: $data
      }, {
          type: 'column',
          name: 'John',
          data: $data
      }, {
          type: 'column',
          name: 'Joe',
          data:$data
      }, {
          type: 'spline',
          name: 'Average',
          data: $data,
          marker: {
              lineWidth: 2,
              lineColor: Highcharts.getOptions().colors[3],
              fillColor: 'white'
          }
      }, {
          type: 'pie',
          name: 'Total consumption',
          data: [{
              name: 'Jane',
              y: ${data[0]},
              color: Highcharts.getOptions().colors[0] // Jane's color
          }, {
              name: 'John',
              y: ${data[1]},
              color: Highcharts.getOptions().colors[1] // John's color
          }, {
              name: 'Joe',
              y: ${data[2]},
              color: Highcharts.getOptions().colors[2] // Joe's color
          }],
          center: [100, 80],
          size: 100,
          showInLegend: false,
          dataLabels: {
              enabled: false
          }
        }]
    }''';

  @override
  Widget build(BuildContext context) {
    print(_chart_data);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('High Chart Example App'),
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                height: 400,
                child: HighCharts(
                  controller: controller,
                  // initialDataData: _chart_data,
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
                    setState(() {
                      controller.upDate(_chart_data);
                    });
                  })
            ],
          ),
        ),
      ),
    );
  }
}
