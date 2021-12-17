import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:high_chart/hign_charts.dart';

class HignChartController extends ChangeNotifier {
  InAppWebViewController? appWebViewController;
  Map _option = {};
  bool _isStock = true;

  Future<void> setOption(Map option, List<List> data, bool isStock,
      {bool resetZoom = false}) async {
    if (_option != option || isStock != _isStock) {
      _option = option;
      _isStock = isStock;

      await appWebViewController?.evaluateJavascript(source: '''
      chart= senthilnasa(`Highcharts.${isStock ? 'stockChart' : 'chart'}('chart',$option)`)

      try {
        var data = $data;
      for(var i = 0; i< data.length;i++){
        chart.series[i].setData(data[i]);
      }
        var index = chart.rangeSelector.buttons.length - 1;
        chart.rangeSelector.clickButton(index);
      }
      catch(err){}

    ''');
    } else {
      // await setData(data, resetZoom: resetZoom);
    }
  }

  // setData(List<List> data, {bool resetZoom = false}) async {
  //   await appWebViewController?.evaluateJavascript(source: '''

  //   try {
  //     var data = $data;
  //   for(var i = 0; i< data.length;i++){
  //     chart.series[i].setData(data[i]);
  //   }
  //     if ($resetZoom){
  //       var index = chart.rangeSelector.buttons.length - 1;
  //       chart.rangeSelector.clickButton(index);
  //     }
  //   }
  //   catch(err){}
  //   ''');
  // }

  Map? options;
  HignChartsType chartsType = HignChartsType.chart;
  dynamic init({dynamic data}) async {
    appWebViewController = data;
    await reset();
  }

  Future<void> setOptions(Map options) async {}
  Future<void> setData(int index, dynamic data) async {
    await appWebViewController?.evaluateJavascript(source: '''
    try {
      chart.series[$index].setData($data);
    }
    catch(err){}
    ''');
    try {
      options?['series'][index]['data'] = data;
    } catch (e) {
      print(e);
    }
  }

  Future<void> setRangeSelector(int index) async {
    await appWebViewController?.evaluateJavascript(source: '''
      try {
        chart.rangeSelector.clickButton($index);
      }
      catch(err){}

    ''');
  }

  Future<void> setRangeSelectorLast() async {
    await appWebViewController?.evaluateJavascript(source: '''
      try {
        var index = chart.rangeSelector.buttons.length - 1;
        chart.rangeSelector.clickButton(index);
      }
      catch(err){}
    ''');
  }

  Future<void> reset() async {
    await appWebViewController?.evaluateJavascript(source: '''
      chart= senthilnasa(`Highcharts.${chartsType == HignChartsType.stockChart ? 'stockChart' : 'chart'}('chart',${json.encode(options ?? {})})`)
       try{
          var index = chart.rangeSelector.buttons.length - 1;
        chart.rangeSelector.clickButton(index);
       } catch(err){}
    ''');
  }
}
