import 'package:flutter/material.dart';
import 'package:nelongso_app/core/utils/colors_util.dart';
import 'package:nelongso_app/core/utils/size_config.dart';
import 'package:nelongso_app/core/widget/basic.appbar.dart';
import 'package:nelongso_app/features/finance/model/chart.item.model.dart';
import 'package:nelongso_app/features/finance/model/noncash.goresto.model.dart';
import 'package:nelongso_app/features/finance/widget/noncash/time.series.bar.dart';

class ListCardGoresto extends StatelessWidget {
  final List<NoncashGorestoModel> model;
  final int year;
  final int month;

  const ListCardGoresto({Key key, this.model, this.year, this.month})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    _newTitle(String _title) {
      return "${_title.substring(0, 1).toUpperCase()}${_title.substring(1).toLowerCase()}";
    }

    void _barWidget(BuildContext context, NoncashGorestoModel _data) async {
      List<DataRow> listDataTable = _data.data.map(
        (e) {
          var dataRow = DataRow(
            cells: <DataCell>[
              DataCell(Text('${e.id}')),
              DataCell(Text('${e.gopay}')),
              DataCell(Text('${e.rekening}')),
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
          chartItem: _data.data
              .map((e) => ChartItem(
                  date: DateTime(year, month, int.parse(e.id)),
                  value: double.parse(e.gopay)))
              .toList(),
        )
      ];

      showDialog(
        context: context,
        child: Scaffold(
          backgroundColor: ColorUtils.bgColor,
          appBar: PreferredSize(
            preferredSize: const Size(double.infinity, kToolbarHeight),
            child: SafeArea(
              left: false,
              right: false,
              bottom: false,
              child: BasicAppbar(
                appbarType: AppbarType.BACK_BUTTON,
                colorAppbarType: ColorUtils.whiteColor,
                bgcolor: ColorUtils.primaryColor,
                title: _newTitle(_data.namaOutlet),
                titlecolor: ColorUtils.lightColor,
                onClickEvent: () => Navigator.pop(context, true),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text('Pendapatan Gopay 85%'),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.widthMultiplier * 2.5,
                  ),
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: TimeSeriesBar(
                    TimeSeriesBar.createData(_dataChartItem),
                    animate: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: DataTable(
                    columnSpacing: 40,
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
                          "Gopay",
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          "Rekening",
                          style: TextStyle(
                            color: Colors.black,
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
        ),
      );
    }

    return Container(
      margin: EdgeInsets.symmetric(
        vertical: SizeConfig.heightMultiplier * 0.25,
        horizontal: SizeConfig.widthMultiplier * 0.5,
      ),
      child: ListView.builder(
        itemCount: model.length,
        itemBuilder: (BuildContext context, int index) {
          final dataSelected = model[index];
          return Container(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 2),
            decoration: BoxDecoration(
              color: ColorUtils.bgColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2.5,
                  blurRadius: 2,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: ListTile(
              title: Text(_newTitle(dataSelected.namaOutlet)),
              subtitle: Text('outlet'),
              onTap: () => _barWidget(context, dataSelected),
              leading: Icon(
                Icons.business_center_outlined,
                size: SizeConfig.imageSizeMultiplier * 10,
                color: ColorUtils.primaryTextColor,
              ),
              trailing: Icon(
                Icons.chevron_right,
                size: SizeConfig.imageSizeMultiplier * 10,
                color: ColorUtils.primaryTextColor,
              ),
            ),
          );
        },
      ),
    );
  }
}
