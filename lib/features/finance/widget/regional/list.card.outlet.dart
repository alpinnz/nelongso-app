import 'package:flutter/material.dart';
import 'package:nelongso_app/core/utils/colors_util.dart';
import 'package:nelongso_app/core/utils/size_config.dart';
import 'package:nelongso_app/core/widget/basic.appbar.dart';
import 'package:nelongso_app/features/finance/model/chart.item.model.dart';
import 'package:nelongso_app/features/finance/model/regional.outlet.model.dart';
import 'package:nelongso_app/features/finance/widget/noncash/time.series.bar.dart';

class ListCardOutlet extends StatelessWidget {
  final List<RegionalOutletModel> model;
  final int year;
  final int month;

  const ListCardOutlet({Key key, this.model, this.year, this.month})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    _newTitle(String _title) {
      if (_title.length > 0) {
        return "${_title.substring(0, 1).toUpperCase()}${_title.substring(1).toLowerCase()}";
      } else {
        return '';
      }
    }

    void _barWidget(BuildContext context, RegionalOutletModel _data) async {
      List<DataRow> listDataTable = _data.data.map(
        (e) {
          var dataRow = DataRow(
            cells: <DataCell>[
              DataCell(Text('${e.id}')),
              DataCell(Text('${e.omzet}')),
            ],
          );
          return dataRow;
        },
      ).toList();

      List<ChartItemModel> _dataChartItem = [
        ChartItemModel(
          id: 'omzet',
          color: 'blue',
          label: 'omzet',
          chartItem: _data.data
              .map((e) => ChartItem(
                  date: DateTime(year, month, int.parse(e.id)),
                  value: double.parse(e.omzet)))
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
                  padding: EdgeInsets.only(
                    top: SizeConfig.heightMultiplier * 1,
                    bottom: SizeConfig.heightMultiplier * 0.1,
                  ),
                  child: Text(
                    'Rekap Outlet Bulanan',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: SizeConfig.textMultiplier * 2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: SizeConfig.widthMultiplier * 1.0,
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
                          "Data",
                          style: TextStyle(
                            color: Colors.blueAccent,
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
              subtitle: Text(_newTitle('outlet')),
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
