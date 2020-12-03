import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/foundation.dart';

class ChartBarSeries {
  final String date;
  final double value;
  final charts.Color barColor;

  ChartBarSeries(
      {@required this.date, @required this.value, @required this.barColor});
}
