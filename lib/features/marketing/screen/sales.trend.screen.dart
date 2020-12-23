import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nelongso_app/core/utils/colors_util.dart';
import 'package:nelongso_app/core/utils/size_config.dart';
import 'package:nelongso_app/core/widget/basic.appbar.dart';
import 'package:nelongso_app/core/widget/failed.host.view.dart';
import 'package:nelongso_app/core/widget/loading.page.indicator.dart';
import 'package:nelongso_app/core/widget/dialog.custom.dart';
import 'package:nelongso_app/core/widget/toast.custom.dart';
import 'package:nelongso_app/features/marketing/bloc/trend_bloc.dart';
import 'package:nelongso_app/features/marketing/widget/trend/list.card.month.dart';
import 'package:nelongso_app/features/marketing/widget/trend/list.card.omzet.dart';
import 'package:nelongso_app/features/marketing/widget/trend/list.card.omzet.year.dart';

class SalesTrendScreen extends StatefulWidget {
  @override
  _SalesTrendScreenState createState() => _SalesTrendScreenState();
}

class _SalesTrendScreenState extends State<SalesTrendScreen> {
  final TrendBloc _bloc = TrendBloc();
  int yearSelected;
  int sheetSelected;

  @override
  void initState() {
    super.initState();
    yearSelected = 0;
    sheetSelected = 0;
  }

  List<String> yearLists = [
    null,
    '2020',
  ];
  List<String> sheetLists = [
    null,
    "TREND OMZET",
    "TREND OMZET OUTLET PER TAHUN",
    "JANUARI",
    "FEBRUARI",
    "MARET",
    "APRIL",
    "MEI",
    "JUNI",
    "JULI",
    "AGUSTUS",
    "SEPTEMBER",
    "OKTOBER",
    "NOVEMBER",
    "DESEMBER",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            title: "Analytics",
            titlecolor: ColorUtils.lightColor,
            onClickEvent: () => Navigator.of(context).pop(),
            actions: <Widget>[
              _popupMenu(),
            ],
          ),
        ),
      ),
      body: _buildBloc(),
    );
  }

  Widget _popupMenu() {
    List<RadioModel> years = yearLists.map((e) {
      var i = yearLists.indexOf(e);
      return RadioModel(
        id: i,
        title: '$e',
        subtitle: 'year',
        value: '$e',
      );
    }).toList();

    List<RadioModel> sheets = sheetLists.map((e) {
      var i = sheetLists.indexOf(e);
      return RadioModel(
        id: i,
        title: '$e',
        subtitle: 'sheet',
        value: '$e',
      );
    }).toList();

    return PopupMenuButton(
      onSelected: (value) {
        switch (value) {
          case 1:
            return DialogCustom(context).selectRadioDialog(
              data: years,
              title: 'Years',
              selected: yearSelected,
              onChange: (val) => setState(() => yearSelected = val),
            );

          case 2:
            return DialogCustom(context).selectRadioDialog(
              data: sheets,
              title: 'Sheets',
              selected: sheetSelected,
              onChange: (val) => setState(() => sheetSelected = val),
            );

            break;
          default:
            Fluttertoast.showToast(
              msg: "You have selected " + value.toString(),
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0,
            );
            break;
        }
      },
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(2, 2, 8, 2),
                child: Icon(Icons.calendar_today),
              ),
              Text('Year')
            ],
          ),
        ),
        PopupMenuItem(
          value: 2,
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(2, 2, 8, 2),
                child: Icon(Icons.list_alt),
              ),
              Text('Sheet')
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBloc() {
    List<int> check = [yearSelected, sheetSelected];
    print(!check.contains(0));
    if (check.contains(0)) {
      return Container(
        child: Center(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.heightMultiplier * 2,
                vertical: SizeConfig.widthMultiplier * 2,
              ),
              child: Text(
                'Selected options more...',
                style: TextStyle(
                  fontSize: SizeConfig.textMultiplier * 2,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      );
    } else {
      if (sheetSelected == 1) {
        _bloc.add(FetchGetTrendOmzet(
          year: yearLists[yearSelected],
          sheet: sheetLists[sheetSelected],
        ));
      } else if (sheetSelected == 2) {
        _bloc.add(FetchGetTrendOmzetYear(
          year: yearLists[yearSelected],
          sheet: sheetLists[sheetSelected],
        ));
      } else if (sheetSelected > 2) {
        _bloc.add(FetchGetTrendMonth(
          year: yearLists[yearSelected],
          sheet: sheetLists[sheetSelected],
        ));
      }
    }
    return BlocProvider(
      create: (_) => _bloc,
      child: BlocListener<TrendBloc, TrendState>(
        listener: (context, state) {
          final error =
              'Year ${yearLists[yearSelected]}, Sheet ${sheetLists[sheetSelected]}';
          if (state is TrendError) {
            ToastCustom(context).showDefault(msg: state.message);
          } else {
            ToastCustom(context).showDefault(msg: error.toString());
          }
        },
        child: BlocBuilder<TrendBloc, TrendState>(
          builder: (context, state) {
            if (state is TrendInitial) {
              return Center(child: LoadingPageIndicator());
            } else if (state is TrendLoading) {
              return Center(child: LoadingPageIndicator());
            } else if (state is TrendOmzetLoaded) {
              return ListCardOmzet(
                model: state.data,
                month: 0,
                year: int.parse(yearLists[yearSelected]),
              );
            } else if (state is TrendOmzetYearLoaded) {
              return ListCardOmzetyear(
                model: state.data,
                month: 0,
                year: int.parse(yearLists[yearSelected]),
              );
            } else if (state is TrendMonthLoaded) {
              return ListCardMonth(
                model: state.data,
                month: 0,
                year: int.parse(yearLists[yearSelected]),
              );
            } else if (state is TrendError) {
              return FailedHostView(state: state.message);
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
