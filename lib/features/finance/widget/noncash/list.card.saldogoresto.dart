import 'package:flutter/material.dart';
import 'package:nelongso_app/core/utils/size_config.dart';
import 'package:nelongso_app/features/finance/model/chart.item.model.dart';
import 'package:nelongso_app/features/finance/model/noncash.saldogoresto.model.dart';
import 'package:nelongso_app/features/finance/widget/noncash/time.series.charts.dart';

class ListCardSaldogoresto extends StatelessWidget {
  final List<NoncashSaldogorestoModel> model;
  final int year;
  final int month;

  const ListCardSaldogoresto({Key key, this.model, this.year, this.month})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<DataRow> listDataTable = model.map(
      (e) {
        var dataRow = DataRow(
          cells: <DataCell>[
            DataCell(Text(e.id)),
            DataCell(Text(e.goRestoAll.debet)),
            DataCell(Text(e.goRestoAll.kredit)),
            DataCell(Text(e.goRestoAll.saldo)),
          ],
        );
        return dataRow;
      },
    ).toList();

    List<ChartItemModel> _dataChartItem = [
      ChartItemModel(
        id: 'goresto',
        color: 'blue',
        label: 'goresto',
        chartItem: model
            .map((e) => ChartItem(
                  date: DateTime(year, month, int.parse(e.id)),
                  value: double.parse(e.goRestoAll.debet),
                ))
            .toList(),
      ),
      ChartItemModel(
        id: 'goresto',
        color: 'red',
        label: 'goresto',
        chartItem: model
            .map((e) => ChartItem(
                  date: DateTime(year, month, int.parse(e.id)),
                  value: double.parse(e.goRestoAll.kredit),
                ))
            .toList(),
      ),
      ChartItemModel(
        id: 'goresto',
        color: 'green',
        label: 'goresto',
        chartItem: model
            .map((e) => ChartItem(
                  date: DateTime(year, month, int.parse(e.id)),
                  value: double.parse(e.goRestoAll.saldo),
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
              child: Text('Gopay'),
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
