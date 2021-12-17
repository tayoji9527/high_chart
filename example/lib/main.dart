import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:async';

import 'package:high_chart/hign_charts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  HignChartController? controller;
  var is1 = true;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                height: 500,
                child: HignCharts(
                  onUpdate: (controller) {
                    print('onUpdate');
                    controller.reset();
                  },
                  onLoad: (controller) {
                    this.controller = controller;
                    if (!is1) controller.setData(0, data);
                  },
                  chartsType:
                      is1 ? HignChartsType.chart : HignChartsType.stockChart,
                  options: is1 ? option : option1,
                ),
              ),
              CupertinoButton(
                  child: Text('change'),
                  onPressed: () {
                    final rad = Random();
                    if (!is1) controller?.setData(0, data);
                  }),
              CupertinoButton(
                  child: Text('option'),
                  onPressed: () {
                    is1 = true;
                    // controller?.options = option;
                    // controller?.chartsType = HignChartsType.chart;

                    // controller?.reset();
                    setState(() {});
                  }),
              CupertinoButton(
                  child: Text('option1'),
                  onPressed: () async {
                    is1 = false;
                    // controller?.options = option1;
                    // controller?.chartsType = HignChartsType.stockChart;
                    // await controller?.reset();
                    // controller?.setData(0, data);
                    setState(() {});
                  }),
              CupertinoButton(
                  child: Text('option'),
                  onPressed: () {
                    controller?.setRangeSelectorLast();
                    setState(() {});
                  })
            ],
          ),
        ),
      ),
    );
  }
}

Map option = {
  'title': {'text': 'option -2010 ~ 2016 年太阳能行业就业人员发展情况'},
  'subtitle': {'text': '数据来源：thesolarfoundation.com'},
  'yAxis': {
    'title': {'text': '就业人数'}
  },
  'legend': {'layout': 'vertical', 'align': 'right', 'verticalAlign': 'middle'},
  'plotOptions': {
    'series': {
      'label': {'connectorAllowed': false},
      'pointStart': 2010
    }
  },
  'series': [
    {
      'name': '安装，实施人员',
      'data': [43934, 5253, 57177, 69658, 97031, 11931, 137133, 154175]
    },
    {
      'name': '工人',
      'data': [24916, 24064, 2942, 29851, 3290, 30282, 38121, 40434]
    },
    {
      'name': '销售',
      'data': [11744, 17722, 16005, 1971, 20185, 24377, 32147, 39387]
    },
    {
      'name': '项目开发',
      'data': [null, null, 7988, 12169, 15112, 22452, 34400, 34227]
    },
    {
      'name': '其他',
      'data': [12908, 5948, 8105, 1148, 8989, 211816, 18274, 18111]
    }
  ],
  'responsive': {
    'rules': [
      {
        'condition': {'maxWidth': 500},
        'chartOptions': {
          'legend': {
            'layout': 'horizontal',
            'align': 'center',
            'verticalAlign': 'bottom'
          }
        }
      }
    ]
  }
};

Map option1 = {
  "extension": {"layout": "single", "height": 600, "col": 4},
  "title": {
    "text": "今日持仓数",
    "style": {"color": "#323f4b", "fontSize": 16.0}
  },
  "xAxis": {
    "type": "datetime",
    "labels": {
      "style": {"color": "#9aa5b1", "fontSize": 12.0}
    }
  },
  "series": [
    {"name": "positions", "color": "#0000FF", "data": []}
  ],
  "chart": {
    "spacingTop": 5.0,
    "spacingLeft": 0.0,
    "spacingRight": 15.0,
    "spacingBottom": 10.0,
    "backgroundColor": "rgba(0,0,0,0)"
  },
  "yAxis": {
    "labels": {
      "style": {"color": "#9aa5b1", "fontSize": 12.0}
    }
  }
};

List data = [
  "[1639578904523.2249,2]",
  "[1639578905500.9792,2]",
  "[1639578906463.9377,2]",
  "[1639578907397.018,2]",
  "[1639578908334.3594,2]",
  "[1639578909344.6045,2]",
  "[1639578910396.997,2]",
  "[1639578911470.9963,2]",
  "[1639578912624.81,2]",
  "[1639578913660.9275,2]",
  "[1639578914694.7417,2]",
  "[1639578915785.4602,2]",
  "[1639578916872.3735,2]",
  "[1639578917894.8005,2]",
  "[1639578918895.7788,2]",
  "[1639578919900.2058,2]",
  "[1639578920901.2327,2]",
  "[1639578921945.166,2]",
  "[1639578922824.6604,2]",
  "[1639578923784.518,2]",
  "[1639578924753.1929,2]",
  "[1639578925817.0251,2]",
  "[1639578926851.888,2]",
  "[1639578927921.6504,2]",
  "[1639578928923.6914,2]",
  "[1639578929858.5273,2]",
  "[1639578930753.8474,2]",
  "[1639578931689.7412,2]",
  "[1639578932715.7417,2]",
  "[1639578933739.5586,2]",
  "[1639578934757.6252,2]",
  "[1639578935903.17,2]",
  "[1639578936947.8884,2]",
  "[1639578937913.88,2]",
  "[1639578938964.8494,2]",
  "[1639578939974.3857,2]",
  "[1639578940925.7344,2]",
  "[1639578941881.119,2]",
  "[1639578942819.7773,2]",
  "[1639578943824.4927,2]",
  "[1639578944919.2305,2]",
  "[1639578945995.5676,2]",
  "[1639578947056.429,2]",
  "[1639578948049.0884,2]",
  "[1639578949091.5967,2]",
  "[1639578950182.9453,2]",
  "[1639578951202.9124,2]",
  "[1639578952223.3877,2]",
  "[1639578953270.4814,2]",
  "[1639578954300.1072,2]",
  "[1639578955229.7485,2]",
  "[1639578956181.4907,2]",
  "[1639578957134.0315,2]",
  "[1639578958056.1143,2]",
  "[1639578958930.525,2]",
  "[1639578959863.8125,2]",
  "[1639578960925.5354,2]",
  "[1639578962004.7634,2]",
  "[1639578963141.3962,2]",
  "[1639578964172.1482,2]",
  "[1639578965308.4177,2]",
  "[1639578966362.0637,2]",
  "[1639578967346.4558,2]",
  "[1639578968298.1072,2]",
  "[1639578969173.0862,2]",
  "[1639578970102.2102,2]",
  "[1639578971075.046,2]",
  "[1639578972028.779,2]",
  "[1639578973062.776,2]",
  "[1639578974123.3594,2]",
  "[1639578975160.9214,2]",
  "[1639578976214.4182,2]",
  "[1639578977232.2034,2]",
  "[1639578978265.4602,2]",
  "[1639578979356.1877,2]",
  "[1639578980420.6826,2]",
  "[1639578981510.0256,2]",
  "[1639578982548.609,2]",
  "[1639578983603.2827,2]",
  "[1639578984543.2905,2]",
  "[1639578985504.0645,2]",
  "[1639578986420.2234,2]",
  "[1639578987369.147,2]",
  "[1639578988310.8008,2]",
  "[1639578989270.266,2]",
  "[1639578990317.9106,2]",
  "[1639578991365.454,2]",
  "[1639578992415.838,2]",
  "[1639578993573.5525,2]",
  "[1639578994586.1975,2]",
  "[1639578995619.8872,2]",
  "[1639578996672.643,2]",
  "[1639578997722.3862,2]",
  "[1639578998768.9016,2]",
  "[1639578999736.5747,2]",
  "[1639579000702.9546,2]",
  "[1639579001670.791,2]",
  "[1639579002659.6821,2]",
  "[1639579003596.9202,2]",
  "[1639579004651.096,2]",
  "[1639579005706.3142,2]",
  "[1639579006765.9373,2]",
  "[1639579007804.9038,2]",
  "[1639579008929.0056,2]",
  "[1639579009927.9807,2]",
  "[1639579010972.41,2]",
  "[1639579011990.4841,2]",
  "[1639579012937.7346,2]",
  "[1639579013884.1025,2]",
  "[1639579014856.2876,2]",
  "[1639579015832.2368,2]",
  "[1639579016777.8516,2]",
  "[1639579017699.4863,2]",
  "[1639579018695.0557,2]",
  "[1639579019747.7898,2]",
  "[1639579020854.6968,2]",
  "[1639579021973.0154,2]",
  "[1639579023111.0442,2]",
  "[1639579024167.227,2]",
  "[1639579025219.0662,2]",
  "[1639579026244.3696,2]",
  "[1639579041583.6958,4]",
  "[1639579042733.5847,4]",
  "[1639579043869.319,4]",
  "[1639579044945.533,4]",
  "[1639579045986.2754,4]",
  "[1639579046940.7007,4]",
  "[1639579047983.2815,4]",
  "[1639579048949.1956,4]",
  "[1639579049928.4136,4]",
  "[1639579050881.1653,4]",
  "[1639579051906.9578,4]",
  "[1639579053071.4995,4]",
  "[1639579054179.3752,4]",
  "[1639579055354.3396,4]",
  "[1639579056602.267,4]",
  "[1639579057681.3599,4]",
  "[1639579058763.3726,4]",
  "[1639579059950.895,4]",
  "[1639579061111.1992,4]",
  "[1639579062111.5671,4]",
  "[1639579063153.7588,4]",
  "[1639579064181.4485,4]",
  "[1639579065140.9062,4]",
  "[1639579066163.3586,4]",
  "[1639579067312.6108,4]",
  "[1639579068406.4524,4]",
  "[1639579069785.5754,4]",
  "[1639579071435.9038,4]",
  "[1639579072945.3342,4]",
  "[1639579074420.3281,4]",
  "[1639579076426.0576,4]",
  "[1639579077705.4783,4]",
  "[1639579079336.2988,4]",
  "[1639579081152.0657,4]",
  "[1639579082550.9731,4]",
  "[1639579083754.1973,4]",
  "[1639579084875.389,4]",
  "[1639579085996.3604,4]",
  "[1639579087013.374,4]",
  "[1639579088173.1042,4]",
  "[1639579088955.006,4]",
  "[1639579089913.1643,4]",
  "[1639579091021.342,4]",
  "[1639579091923.6287,4]",
  "[1639579092863.94,4]",
  "[1639579093947.473,4]",
  "[1639579095131.6343,4]",
  "[1639579096016.5425,4]",
  "[1639579096809.267,4]",
  "[1639579097587.2073,4]",
  "[1639579098328.3953,4]",
  "[1639579099087.172,4]",
  "[1639579099789.9648,4]",
  "[1639579100456.8318,4]",
  "[1639579101191.7397,4]",
  "[1639579102142.5093,4]",
  "[1639579102965.5276,4]",
  "[1639579103760.765,4]",
  "[1639579104527.6165,4]",
  "[1639579105425.5544,4]",
  "[1639579106328.3162,4]",
  "[1639579107465.04,4]",
  "[1639579108678.3674,4]",
  "[1639579109842.5383,4]",
  "[1639579111018.2698,4]",
  "[1639579112105.7478,4]",
  "[1639579113124.2869,4]",
  "[1639579114124.5244,4]",
  "[1639579115053.5793,4]",
  "[1639579116059.768,4]",
  "[1639579117044.225,4]",
  "[1639579117954.0942,4]",
  "[1639579119000.7651,4]",
  "[1639579120101.2673,4]",
  "[1639579121259.1912,4]",
  "[1639579122623.9758,4]",
  "[1639579123736.9917,4]",
  "[1639579124861.0205,4]",
  "[1639579125996.806,4]",
  "[1639579127101.7617,4]",
  "[1639579128207.3628,4]",
  "[1639579129300.036,4]",
  "[1639579130323.9084,4]",
  "[1639579131318.2026,4]",
  "[1639579132301.5403,4]",
  "[1639579133264.912,4]",
  "[1639579134253.6353,4]",
  "[1639579135210.2825,4]",
  "[1639579136397.6458,4]",
  "[1639579137586.1504,4]",
  "[1639579138751.6501,4]",
  "[1639579139905.9402,4]",
  "[1639579141111.7896,4]",
  "[1639579142262.87,4]",
  "[1639579143459.1233,4]",
  "[1639579144591.4807,4]",
  "[1639579145747.7417,4]",
  "[1639579146833.674,4]",
  "[1639579147764.8564,4]",
  "[1639579148738.043,4]",
  "[1639579149738.4856,4]",
  "[1639579150731.7017,4]",
  "[1639579151908.858,4]",
  "[1639579152997.2327,4]",
  "[1639579154218.9033,4]",
  "[1639579155338.855,4]",
  "[1639579156434.7368,4]",
  "[1639579157617.361,4]",
  "[1639579158705.7078,4]",
  "[1639579159827.7847,4]",
  "[1639579160940.8623,4]",
  "[1639579162081.0476,4]",
  "[1639579163299.9353,4]",
  "[1639579164279.4927,4]",
  "[1639579165255.6987,4]",
  "[1639579166199.001,4]",
  "[1639579167252.669,4]",
  "[1639579168154.1626,4]",
  "[1639579169237.0305,4]",
  "[1639579170413.2202,4]",
  "[1639579171578.3228,4]",
  "[1639579172748.1624,4]",
  "[1639579173907.3496,4]",
  "[1639579174987.4524,4]",
  "[1639579176159.5325,4]",
  "[1639579177288.7324,4]",
  "[1639579178368.2815,4]",
  "[1639579179462.5461,4]",
  "[1639579180554.9253,4]",
  "[1639579181521.2065,4]",
  "[1639579182576.777,4]",
  "[1639579183566.063,4]",
  "[1639579184500.605,4]",
  "[1639579185421.0083,4]",
  "[1639579186497.796,4]",
  "[1639579187558.7185,4]",
  "[1639579188747.6697,4]",
  "[1639579189821.9321,4]",
  "[1639579190966.9407,4]",
  "[1639579192052.4348,4]",
  "[1639579193198.853,4]",
  "[1639579194353.6416,4]",
  "[1639579195473.3032,4]",
  "[1639579196648.211,4]",
  "[1639579197641.3586,4]",
  "[1639579198631.488,4]",
  "[1639579199588.2854,4]",
  "[1639579200575.413,4]",
  "[1639579201592.175,4]",
  "[1639579202612.2234,4]",
  "[1639579203753.5732,4]",
  "[1639579204881.5347,4]",
  "[1639579206039.761,4]",
  "[1639579207122.722,4]",
  "[1639579208332.2874,4]",
  "[1639579209406.412,4]",
  "[1639579210579.259,4]",
  "[1639579211862.9478,4]",
  "[1639579213074.049,4]",
  "[1639579214132.9485,4]",
  "[1639579215078.8462,4]",
  "[1639579216054.6382,4]",
  "[1639579217021.784,4]",
  "[1639579217975.3242,4]",
  "[1639579218921.825,4]",
  "[1639579219878.3145,4]",
  "[1639579220990.8828,4]",
  "[1639579222157.41,4]",
  "[1639579223328.2898,4]",
  "[1639579224489.9104,4]",
  "[1639579225778.4639,4]",
  "[1639579226986.2317,4]",
  "[1639579228133.1003,4]",
  "[1639579229238.5166,4]",
  "[1639579230272.3171,4]",
  "[1639579231220.3508,4]",
  "[1639579232177.872,4]",
  "[1639579233199.851,4]",
  "[1639579234159.3333,4]",
  "[1639579235141.8442,4]",
  "[1639579235983.7852,4]",
  "[1639579236757.0728,4]",
  "[1639579237487.678,4]",
  "[1639579238381.5662,4]",
  "[1639579239525.0486,4]",
  "[1639579240749.693,4]",
  "[1639579241862.4788,4]",
  "[1639579242907.9788,4]",
  "[1639579244059.71,4]",
  "[1639579245109.1992,4]",
  "[1639579246115.9822,4]",
  "[1639579247025.1665,4]",
  "[1639579248029.0542,4]",
  "[1639579249032.501,4]",
  "[1639579250134.9446,4]",
  "[1639579251268.7249,4]",
  "[1639579252401.551,4]",
  "[1639579253507.0134,4]",
  "[1639579254754.998,4]",
  "[1639579255894.9426,4]",
  "[1639579257077.866,4]",
  "[1639579258235.0427,4]",
  "[1639579259394.7476,4]",
  "[1639579260496.767,4]",
  "[1639579261568.544,4]",
  "[1639579262615.4082,4]",
  "[1639579263584.7227,4]",
  "[1639579264564.2205,4]",
  "[1639579265513.9653,4]",
  "[1639579266531.9553,4]",
  "[1639579267748.0388,4]",
  "[1639579271414.2173,3]",
  "[1639579280270.5068,0]"
];
