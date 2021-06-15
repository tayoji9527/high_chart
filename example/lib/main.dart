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
}

const aaa = '''{
    "extension": {
        "layout": "single",
        "col": 4,
        "height": "300px"
    },
    "title": {
        "text": "饼图2"
    },
    "series": [
        {
            "type": "pie",
            "name": "one",
            "data": [
                [
                    "A",
                    21.626222464683842
                ],
                [
                    "B",
                    25
                ],
                [
                    "C",
                    25
                ],
                [
                    "D",
                    25
                ]
            ]
        }
    ]
}''';
