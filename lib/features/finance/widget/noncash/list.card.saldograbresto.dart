import 'package:flutter/material.dart';
import 'package:nelongso_app/core/utils/colors_util.dart';
import 'package:nelongso_app/core/utils/size_config.dart';
import 'package:nelongso_app/core/widget/basic.appbar.dart';
import 'package:nelongso_app/features/finance/model/chart.item.model.dart';
import 'package:nelongso_app/features/finance/model/noncash.grabresto.model.dart';
import 'package:nelongso_app/features/finance/model/noncash.saldograbresto.model.dart';
import 'package:nelongso_app/features/finance/widget/noncash/time.series.bar.dart';
import 'package:nelongso_app/features/finance/widget/noncash/time.series.charts.dart';

class ListCardSaldograbresto extends StatelessWidget {
  final List<NoncashSaldograbrestoModel> model;
  final int year;
  final int month;

  const ListCardSaldograbresto({Key key, this.model, this.year, this.month})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<DataRow> listDataTable = model.map(
      (e) {
        var dataRow = DataRow(
          cells: <DataCell>[
            DataCell(Text(e.id)),
            DataCell(Text(e.grabOvoAll.debet)),
            DataCell(Text(e.grabOvoAll.kredit)),
            DataCell(Text(e.grabOvoAll.saldo)),
          ],
        );
        return dataRow;
      },
    ).toList();

    List<ChartItemModel> _dataChartItem = [
      ChartItemModel(
        id: 'grabresto',
        color: 'blue',
        label: 'grabresto',
        chartItem: model
            .map((e) => ChartItem(
                  date: DateTime(year, month, int.parse(e.id)),
                  value: double.parse(e.grabOvoAll.debet),
                ))
            .toList(),
      ),
      ChartItemModel(
        id: 'grabresto',
        color: 'red',
        label: 'grabresto',
        chartItem: model
            .map((e) => ChartItem(
                  date: DateTime(year, month, int.parse(e.id)),
                  value: double.parse(e.grabOvoAll.kredit),
                ))
            .toList(),
      ),
      ChartItemModel(
        id: 'grabresto',
        color: 'green',
        label: 'grabresto',
        chartItem: model
            .map((e) => ChartItem(
                  date: DateTime(year, month, int.parse(e.id)),
                  value: double.parse(e.grabOvoAll.saldo),
                ))
            .toList(),
      )
    ];

    return Container(
      margin: EdgeInsets.symmetric(
        vertical: SizeConfig.heightMultiplier * 0.25,
        horizontal: SizeConfig.widthMultiplier * 0.5,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text('Ovo'),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.widthMultiplier * 2.5,
              ),
              height: MediaQuery.of(context).size.height * 0.5,
              child: TimeSeriesCharts(
                TimeSeriesCharts.createData(_dataChartItem),
                animate: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: DataTable(
                columnSpacing: 35,
                columns: <DataColumn>[
                  DataColumn(
                    label: Text(
                      "Date",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      "Debit",
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      "Kredit",
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      "Saldo",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
                rows: listDataTable,
              ),
            )
          ],
        ),
      ),
    );
  }
}
