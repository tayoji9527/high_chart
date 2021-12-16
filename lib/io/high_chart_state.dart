part of highcharts_io;

class HignChartState extends State<HignChart> {
  HignChartController? _hignChartController;
  bool isLoading = true;

  InAppWebViewGroupOptions get _options => InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
          transparentBackground: true,
          disableVerticalScroll: true,
          disableContextMenu: Platform.isIOS,
          disableHorizontalScroll: Platform.isIOS),
      ios: IOSInAppWebViewOptions()
      // android: AndroidInAppWebViewOptions(
      //     useHybridComposition: true,
      //     ),
      );
  @override
  void initState() {
    super.initState();
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
      _buildWebView(),
      Positioned(
        child: Container(
          child: isLoading ? CupertinoActivityIndicator() : SizedBox.shrink(),
        ),
      )
    ]));
  }

  Widget _buildWebView() {
    return InAppWebView(
      initialData: InAppWebViewInitialData(data: htmlData()),
      onWebViewCreated: (controller) async {},
      onLoadStop: (controller, url) async {
        _hignChartController = HignChartController()
          ..appWebViewController = controller;
        _hignChartController?.setOption(
            widget.option, widget.data, widget.isStock);
        isLoading = false;
        setState(() {});
      },
      initialOptions: _options,
      onConsoleMessage: (c, e) {
        print(e);
      },
    );
  }
}
