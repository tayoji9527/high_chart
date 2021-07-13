library hign_chart;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:high_chart/high_chart_script.dart';
import 'package:high_chart/high_stock_script.dart';

class _HignChartController {
  InAppWebViewController? _appWebViewController;
  String _option = '';
  bool _isStock = true;

  Future<void> setOption(String option, List<List> data, bool isStock,
      {bool resetZoom = false}) async {
    // await _appWebViewController?.evaluateJavascript(source: '''
    //   chart= senthilnasa(`Highcharts.${isStock ? 'stockChart' : 'chart'}('chart',$option)`)
    //   var data = $data;
    //   for(var i = 0; i< data.length;i++){
    //     chart.series[i].setData(data[i]);
    //   }
    // ''');
    // return;
    if (_option != option || isStock != _isStock) {
      _option = option;
      _isStock = isStock;
      await _appWebViewController?.evaluateJavascript(source: '''
      chart= senthilnasa(`Highcharts.${isStock ? 'stockChart' : 'chart'}('chart',$option)`)
      var data = $data;
      
      for(var i = 0; i< data.length;i++){
        chart.series[i].setData(data[i]);
      }
      
    ''');
    } else {
      await setData(data, resetZoom: resetZoom);
    }
  }

  setData(List<List> data, {bool resetZoom = false}) async {
    await _appWebViewController?.evaluateJavascript(source: '''
    var data = $data;
    for(var i = 0; i< data.length;i++){
      chart.series[i].setData(data[i]);
    }
    try {
      if ($resetZoom){
      var index = chart.rangeSelector.buttons.length - 1;
      chart.rangeSelector.clickButton(index);
      }
    }
    catch(err){}
    ''');
  }
}

class HignChart extends StatefulWidget {
  final String option;
  final bool isStock;
  final List<List> data;
  final bool resetZoom;

  HignChart(
      {required this.option,
      required this.data,
      this.isStock = true,
      this.resetZoom = false});
  @override
  State<StatefulWidget> createState() {
    return _HignChartState();
  }
}

class _HignChartState extends State<HignChart> {
  _HignChartController? _hignChartController;
  bool isLoading = true;

  InAppWebViewGroupOptions get _options => InAppWebViewGroupOptions(
        crossPlatform: InAppWebViewOptions(
            transparentBackground: true,
            disableVerticalScroll: true,
            disableContextMenu: true,
            disableHorizontalScroll: true),
        android: AndroidInAppWebViewOptions(
          useHybridComposition: true,
        ),
      );
  @override
  void initState() {
    super.initState();
  }

  String htmlData() {
    return '''<!DOCTYPE html>
      <head><meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0" /> 
      <style type="text/css">html, body,div {width:100%;height:100%;}</style>
      </head>
      <body>
      <div id="chart"></div></body>
      <script>
      ${widget.isStock ? highstockScript : highchartsScript}
      
      var chart;
       function senthilnasa(a){    return eval(a);}
      </script></html>''';
  }

  int count = 100;

  @override
  Widget build(BuildContext context) {
    _hignChartController?.setOption(widget.option, widget.data, widget.isStock,
        resetZoom: widget.resetZoom);
    return Container(
        child: Stack(alignment: Alignment.center, children: [
      InAppWebView(
        initialData: InAppWebViewInitialData(data: htmlData()),
        onWebViewCreated: (controller) async {},
        onLoadStop: (controller, url) async {
          _hignChartController = _HignChartController()
            .._appWebViewController = controller;
          _hignChartController?.setOption(
              widget.option, widget.data, widget.isStock);
          isLoading = false;
          setState(() {});
        },
        initialOptions: _options,
        onConsoleMessage: (c, e) {
          print(e);
        },
      ),
      Positioned(
        child: Container(
          child: isLoading ? CupertinoActivityIndicator() : SizedBox.shrink(),
        ),
      )
    ]));
  }
}
