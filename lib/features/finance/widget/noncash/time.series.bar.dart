/// Example of a time series chart using a bar renderer.
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:nelongso_app/features/finance/model/chart.item.model.dart';

class TimeSeriesBar extends StatelessWidget {
  final List<charts.Series<ChartItem, DateTime>> seriesList;
  final bool animate;

  TimeSeriesBar(this.seriesList, {this.animate});

  @override
  Widget build(BuildContext context) {
    return charts.TimeSeriesChart(
      seriesList,
      animate: animate,
      defaultRenderer: new charts.BarRendererConfig<DateTime>(),
      defaultInteractions: false,
      behaviors: [charts.SelectNearest(), charts.DomainHighlighter()],
    );
  }

  static List<charts.Series<ChartItem, DateTime>> createData(
      List<ChartItemModel> data) {
    List<ChartItemModel> sampelData = [
      ChartItemModel(
        id: 'data1',
        label: 'Data 1',
        color: 'red',
        chartItem: [
          ChartItem(date: DateTime(2020, 11, 1), value: 2),
          ChartItem(date: DateTime(2020, 11, 2), value: 4),
          ChartItem(date: DateTime(2020, 11, 3), value: 6),
          ChartItem(date: DateTime(2020, 11, 4), value: 8),
        ],
      ),
      ChartItemModel(
        id: 'data2',
        label: 'Data 2',
        color: 'blue',
        chartItem: [
          // ChartItem(id: 0, value: 2),
          ChartItem(date: DateTime(2020, 11, 1), value: 8),
          ChartItem(date: DateTime(2020, 11, 2), value: 7),
          ChartItem(date: DateTime(2020, 11, 3), value: 7),
          ChartItem(date: DateTime(2020, 11, 4), value: 8),
        ],
      ),
      ChartItemModel(
        id: 'data3',
        label: 'Data 3',
        color: 'green',
        chartItem: [
          // ChartItem(id: 0, value: 5),
          ChartItem(date: DateTime(2020, 11, 1), value: 5),
          ChartItem(date: DateTime(2020, 11, 2), value: 5),
          ChartItem(date: DateTime(2020, 11, 3), value: 5),
          ChartItem(date: DateTime(2020, 11, 4), value: 5),
        ],
      ),
      ChartItemModel(
        id: 'data4',
        label: 'Data 4',
        color: 'gray',
        chartItem: [
          // ChartItem(id: 0, value: 5),
          ChartItem(date: DateTime(2020, 11, 1), value: 1),
          ChartItem(date: DateTime(2020, 11, 2), value: 1),
          ChartItem(date: DateTime(2020, 11, 3), value: 1),
          ChartItem(date: DateTime(2020, 11, 4), value: 1),
        ],
      ),
      ChartItemModel(
        id: 'data4',
        label: 'Data 4',
        color: 'deepOrange',
        chartItem: [
          // ChartItem(id: 0, value: 51),
          ChartItem(date: DateTime(2020, 11, 1), value: 11),
          ChartItem(date: DateTime(2020, 11, 2), value: 11),
          ChartItem(date: DateTime(2020, 11, 3), value: 1),
          ChartItem(date: DateTime(2020, 11, 4), value: 1),
        ],
      ),
    ];

    final result = data == null
        ? sampelData.map((e) {
            var color;
            switch (e.color) {
              case 'green':
                color = charts.MaterialPalette.green.shadeDefault;
                break;
              case 'red':
                color = charts.MaterialPalette.red.shadeDefault;
                break;
              case 'blue':
                color = charts.MaterialPalette.blue.shadeDefault;
                break;
              case 'gray':
                color = charts.MaterialPalette.gray.shadeDefault;
                break;
              case 'deepOrange':
                color = charts.MaterialPalette.deepOrange.shadeDefault;
                break;
              default:
                color = charts.MaterialPalette.red.shadeDefault;
                break;
            }
            return charts.Series<ChartItem, DateTime>(
              id: '${e.id}',
              colorFn: (_, __) => color,
              domainFn: (ChartItem sales, _) => sales.date,
              measureFn: (ChartItem sales, _) => sales.value,
              data: e.chartItem,
            );
          }).toList()
        : data.map((e) {
            var color;
            switch (e.color) {
              case 'green':
                color = charts.MaterialPalette.green.shadeDefault;
                break;
              case 'red':
                color = charts.MaterialPalette.red.shadeDefault;
                break;
              case 'blue':
                color = charts.MaterialPalette.blue.shadeDefault;
                break;
              case 'gray':
                color = charts.MaterialPalette.gray.shadeDefault;
                break;
              case 'deepOrange':
                color = charts.MaterialPalette.deepOrange.shadeDefault;
                break;
              default:
                color = charts.MaterialPalette.red.shadeDefault;
                break;
            }
            return charts.Series<ChartItem, DateTime>(
              id: '${e.id}',
              colorFn: (_, __) => color,
              domainFn: (ChartItem sales, _) => sales.date,
              measureFn: (ChartItem sales, _) => sales.value,
              data: e.chartItem,
            );
          }).toList();

    return result;
  }
}
