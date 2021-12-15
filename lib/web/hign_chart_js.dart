@JS('Highcharts')
library highcharts;

import 'package:js/js.dart';
import 'package:js/js_util.dart';

@JS('chart')
class Highcharts {
  external Highcharts(dynamic div, MapOptions options);
}

@JS()
@anonymous
class MapOptions {
  external factory MapOptions();
  external set accessibility(dynamic v);
  external set annotations(dynamic v);
  external set boost(dynamic v);
  external set chart(dynamic v);
  external set colorAxis(dynamic v);
  external set colors(dynamic v);
  external set credits(dynamic v);
  external set data(dynamic v);
  external set defs(dynamic v);
  external set drilldown(dynamic v);
  external set exporting(dynamic v);
  external set labels(dynamic v);
  external set legend(dynamic v);
  external set loading(dynamic v);
  external set navigation(dynamic v);
  external set noData(dynamic v);
  external set pane(dynamic v);
  external set plotOptions(dynamic v);
  external set responsive(dynamic v);
  external set title(dynamic v);
  external set subtitle(dynamic v);
  external set time(dynamic v);
  external set tooltip(dynamic v);
  external set xAxis(dynamic v);
  external set yAxis(dynamic v);
  external set zAxis(dynamic v);
  external set series(dynamic v);
}

MapOptions getOptions(Map o) {
  final options = MapOptions();
  dynamic value;
  value = o.jsifyKey('accessibility');
  if (value != null) options.accessibility = value;
  value = o.jsifyKey('annotations');
  if (value != null) options.annotations = value;
  value = o.jsifyKey('boost');
  if (value != null) options.boost = value;
  value = o.jsifyKey('chart');
  if (value != null) options.chart = value;
  value = o.jsifyKey('colorAxis');
  if (value != null) options.colorAxis = value;
  value = o.jsifyKey('colors');
  if (value != null) options.colors = value;
  value = o.jsifyKey('credits');
  if (value != null) options.credits = value;
  value = o.jsifyKey('data');
  if (value != null) options.data = value;
  value = o.jsifyKey('defs');
  if (value != null) options.defs = value;
  value = o.jsifyKey('drilldown');
  if (value != null) options.drilldown = value;
  value = o.jsifyKey('exporting');
  if (value != null) options.exporting = value;
  value = o.jsifyKey('labels');
  if (value != null) options.labels = value;
  value = o.jsifyKey('legend');
  if (value != null) options.legend = value;
  value = o.jsifyKey('loading');
  if (value != null) options.loading = value;
  value = o.jsifyKey('navigation');
  if (value != null) options.navigation = value;
  value = o.jsifyKey('noData');
  if (value != null) options.noData = value;
  value = o.jsifyKey('pane');
  if (value != null) options.pane = value;
  value = o.jsifyKey('plotOptions');
  if (value != null) options.plotOptions = value;
  value = o.jsifyKey('responsive');
  if (value != null) options.responsive = value;
  value = o.jsifyKey('title');
  if (value != null) options.title = value;
  value = o.jsifyKey('subtitle');
  if (value != null) options.subtitle = value;
  value = o.jsifyKey('xAxis');
  if (value != null) options.xAxis = value;
  value = o.jsifyKey('yAxis');
  if (value != null) options.yAxis = value;
  value = o.jsifyKey('zAxis');
  if (value != null) options.zAxis = value;
  value = o.jsifyKey('series');
  if (value != null) options.series = value;

  return options;
}

extension _JsifyMap on Map {
  dynamic jsifyKey(String key) {
    try {
      return jsify(this[key]);
    } catch (e) {}
  }
}

@JS()
@anonymous
class MapTitle {
  external factory MapTitle({
    String text,
    Map subtitle,
  });
  external String get text;
}

@JS()
@anonymous
class Series {
  external factory Series();
  external setData(dynamic data);
}
