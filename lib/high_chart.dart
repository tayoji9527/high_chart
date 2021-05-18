library highchart;

import 'dart:io' show Platform;
import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:high_chart/high_stock_script.dart';

class HighCharts extends StatefulWidget {
  HighCharts({Key key, this.data}) : super(key: key);

  final String data;

  @override
  _HighChartsState createState() => _HighChartsState();
}

String htmlData() =>
    '<!DOCTYPE html><html><head><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0" /> <style type="text/css">html, body {touch-action: none;-ms-touch-action: none;}</style></head><body><div id="chart"></div></body></html><script>$highstockScript function senthilnasa(a){ eval(a); return true;}</script></html>';

/// data:text/html;base64, 'data:text/html;base64,' + base64Encode(const Utf8Encoder().convert( /* STRING ABOVE */ ))
// const highChartHtml =
//     'PCFET0NUWVBFIGh0bWw+PGh0bWw+PGhlYWQ+PG1ldGEgY2hhcnNldD0idXRmLTgiPjxtZXRhIG5hbWU9InZpZXdwb3J0IiBjb250ZW50PSJ3aWR0aD1kZXZpY2Utd2lkdGgsIGluaXRpYWwtc2NhbGU9MS4wLCBtYXhpbXVtLXNjYWxlPTEuMCwgbWluaW11bS1zY2FsZT0xLjAsIHVzZXItc2NhbGFibGU9MCIgLz48L2hlYWQ+PGJvZHk+PGRpdiBpZD0iY2hhcnQiPjxoMT5QbGVhc2UgV2FpdCAhISEgPC9oMT48L2Rpdj48L2JvZHk+PC9odG1sPjxzY3JpcHQ+ZnVuY3Rpb24gc2VudGhpbG5hc2EoYSl7IGV2YWwoYSk7IHJldHVybiB0cnVlO30NCjwvc2NyaXB0PjwvaHRtbD4=';

class _HighChartsState extends State<HighCharts> {
  String get _currentData => widget.data;

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

  @override
  Widget build(BuildContext context) {
    update();
    return InAppWebView(
      initialData: InAppWebViewInitialData(data: htmlData()),
      onWebViewCreated: (controller) async {
        _webViewController = controller;
        update();
      },
      initialOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(transparentBackground: true)),
    );
  }
}
