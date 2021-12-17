import 'dart:io';

import 'package:flutter/cupertino.dart';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:high_chart/hign_charts.dart';
import 'package:high_chart/hign_charts_widget.dart';
import 'high_stock_script.dart';

class HignChartState extends State<HignCharts> {
  final controller = HignChartController();
  var isLoadstop = false;

  InAppWebViewGroupOptions get _options => InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
          transparentBackground: true,
          disableVerticalScroll: true,
          disableContextMenu: Platform.isIOS,
          disableHorizontalScroll: Platform.isIOS),
      ios: IOSInAppWebViewOptions());
  @override
  void initState() {
    super.initState();

    controller.options = widget.options;
    controller.chartsType = widget.chartsType;
  }

  @override
  void didUpdateWidget(covariant HignCharts oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (isLoadstop) {
      (widget.onUpdate ?? (dynamic) {})(this.controller);
    }
    // if (controller.options.hashCode != widget.options.hashCode) {
    //   controller.options = widget.options;
    //   controller.reset();
    // }
  }

  String htmlData() {
    return '''<!DOCTYPE html>
      <head><meta charset="utf-8">

      <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0" /> 
      <style type="text/css">html, body,div {width:100%;height:100%;touch-action: none;-ms-touch-action: none;}</style>
      </head>
      <body>
      <div id="chart"></div></body>
      <script>
      $highstockScript
      
      var chart;
       function senthilnasa(a){    return eval(a);}
      </script></html>''';
  }

  int count = 100;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(alignment: Alignment.center, children: [
      _buildWebView(),
      Positioned(
        child: Container(
          child: !isLoadstop ? CupertinoActivityIndicator() : SizedBox.shrink(),
        ),
      )
    ]));
  }

  Widget _buildWebView() {
    return InAppWebView(
      initialData: InAppWebViewInitialData(data: htmlData()),
      onWebViewCreated: (controller) async {},
      onLoadStop: (controller, url) async {
        await this.controller.init(data: controller);
        isLoadstop = true;
        (widget.onLoad ?? (dynamic) {})(this.controller);
        setState(() {});
      },
      initialOptions: _options,
      onConsoleMessage: (c, e) {
        print(e);
      },
    );
  }
}
