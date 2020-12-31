import 'package:flutter/material.dart';
import 'package:nelongso_app/core/utils/colors_util.dart';
import 'package:nelongso_app/core/utils/size_config.dart';
import 'package:nelongso_app/core/widget/basic.appbar.dart';
import 'package:nelongso_app/features/finance/widget/text.view.widget.dart';
import 'package:nelongso_app/features/marketing/model/trend.omzet.model.dart';

class ListCardOmzet extends StatelessWidget {
  final List<TrendOmzetModel> model;
  final int year;
  final int month;

  const ListCardOmzet({Key key, this.model, this.year, this.month})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    _convertToKapital(string) {
      if (string.length > 0) {
        return "${string.substring(0, 1).toUpperCase()}${string.substring(1).toLowerCase()}";
      } else {
        return '';
      }
    }

    void _barWidget(BuildContext context, TrendOmzetModel _data) async {
      final json = _data.toJson();

      List<Widget> _listDataTextWidget() {
        List<Widget> widget = [];
        json.forEach((k, v) {
          if (v is String) {
            widget.add(TextViewWidget(
              title: k,
              value: v,
              width: 160,
            ));
          }
          // else if (v is List) {
          //   widget.add(TextViewWidget(title: k));

          //   json[k].forEach((e) {
          //     e.forEach((key, value) {
          //       List _keyArray = key.split('_').toList();
          //       int i = _keyArray.length == 1 ? 1 : 2;
          //       final _keyText = _keyArray.getRange(0, i).join(' ');
          //       if (_keyText != 'id') {
          //         widget.add(TextViewWidget(
          //           title: _keyText,
          //           value: value,
          //           width: 160,
          //         ));
          //       }
          //     });
          //   });
          // }
          else {
            widget.add(TextViewWidget(title: k));
            json[k].forEach((key, value) {
              List _keyArray = key.split('_').toList();
              int i = _keyArray.length == 1 ? 1 : 2;
              final _keyText = _keyArray.getRange(0, i).join(' ');
              widget.add(TextViewWidget(
                title: _keyText,
                value: value,
                width: 160,
              ));
            });
          }
        });
        return widget;
      }

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
                title: 'Trend Omzet',
                titlecolor: ColorUtils.lightColor,
                onClickEvent: () => Navigator.pop(context, true),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                top: SizeConfig.heightMultiplier * 2,
                bottom: SizeConfig.heightMultiplier * 5,
              ),
              child: Column(
                children: _listDataTextWidget(),
              ),
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
                  offset: Offset(0, 1),
                ),
              ],
            ),
            child: ListTile(
              title: Text(_convertToKapital('${dataSelected.bulan}')),
              subtitle: Text(_convertToKapital('${dataSelected.bulan}')),
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
