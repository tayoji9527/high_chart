@JS('Highcharts')
library highcharts;

import 'package:js/js.dart';

@JS('Chart')
class Highcharts {
  external Highcharts(dynamic div, MapOptions options);
}

@JS()
@anonymous
class MapOptions {
  external factory MapOptions({
    MapTitle title,
  });
  external MapTitle get title;
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
