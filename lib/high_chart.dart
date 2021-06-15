library highchart;

import 'dart:io' show Platform;
import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:high_chart/high_chart_script.dart';
import 'package:high_chart/high_stock_script.dart';

class HighCharts extends StatefulWidget {
  final Function(bool isLoadStop) onLoad;
  HighCharts({Key key, this.data, this.onLoad, this.isStock = true})
      : super(key: key);

  final String data;
  final bool isStock;

  @override
  _HighChartsState createState() => _HighChartsState();
}

/// data:text/html;base64, 'data:text/html;base64,' + base64Encode(const Utf8Encoder().convert( /* STRING ABOVE */ ))
// const highChartHtml =
//     'PCFET0NUWVBFIGh0bWw+PGh0bWw+PGhlYWQ+PG1ldGEgY2hhcnNldD0idXRmLTgiPjxtZXRhIG5hbWU9InZpZXdwb3J0IiBjb250ZW50PSJ3aWR0aD1kZXZpY2Utd2lkdGgsIGluaXRpYWwtc2NhbGU9MS4wLCBtYXhpbXVtLXNjYWxlPTEuMCwgbWluaW11bS1zY2FsZT0xLjAsIHVzZXItc2NhbGFibGU9MCIgLz48L2hlYWQ+PGJvZHk+PGRpdiBpZD0iY2hhcnQiPjxoMT5QbGVhc2UgV2FpdCAhISEgPC9oMT48L2Rpdj48L2JvZHk+PC9odG1sPjxzY3JpcHQ+ZnVuY3Rpb24gc2VudGhpbG5hc2EoYSl7IGV2YWwoYSk7IHJldHVybiB0cnVlO30NCjwvc2NyaXB0PjwvaHRtbD4=';

class _HighChartsState extends State<HighCharts> {
  String get _currentData => widget.data;
  final GlobalKey webViewKey = GlobalKey();

  InAppWebViewController _webViewController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void update() async {
    await _webViewController?.callAsyncJavaScript(functionBody: '''
        var a= senthilnasa(`Highcharts.stockChart('chart',
        ${_currentData ?? ''}
        )`);
    ''');
  }

  String htmlData() =>
      '<!DOCTYPE html><html><head><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0" /> <style type="text/css">html, body,div {touch-action: none;-ms-touch-action: none;height:100%;-webkit-touch-callout:none;-webkit-user-select:none; -khtml-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none;}</style></head><body><div id="chart"></div></body></html><script>${widget.isStock ? highstockScript : highchartsScript} function senthilnasa(a){ eval(a); return true;}</script></html>';

  @override
  Widget build(BuildContext context) {
    update();

    return InAppWebView(
      initialData: InAppWebViewInitialData(data: htmlData()),
      onWebViewCreated: (controller) async {
        _webViewController = controller;
        update();
        if (widget.onLoad != null) widget.onLoad(false);
      },
      onLoadStop: (controller, url) {
        update();
        if (widget.onLoad != null) widget.onLoad(true);
      },
      onLoadStart: (controller, url) {},
      initialOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(transparentBackground: true)),
    );
  }
}
