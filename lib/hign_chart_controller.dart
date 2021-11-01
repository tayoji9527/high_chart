import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class HignChartController {
  InAppWebViewController? appWebViewController;
  String _option = '';
  bool _isStock = true;

  Future<void> setOption(String option, List<List> data, bool isStock,
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
      await setData(data, resetZoom: resetZoom);
    }
  }

  setData(List<List> data, {bool resetZoom = false}) async {
    await appWebViewController?.evaluateJavascript(source: '''

    try {
      var data = $data;
    for(var i = 0; i< data.length;i++){
      chart.series[i].setData(data[i]);
    }
      if ($resetZoom){
        var index = chart.rangeSelector.buttons.length - 1;
        chart.rangeSelector.clickButton(index);
      }
    }
    catch(err){}
    ''');
  }
}
