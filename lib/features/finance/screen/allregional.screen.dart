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
import 'package:nelongso_app/features/finance/bloc/allregional_bloc.dart';
import 'package:nelongso_app/features/finance/widget/allregional/list.card.biaya.dart';
import 'package:nelongso_app/features/finance/widget/allregional/list.card.data.dart';
import 'package:nelongso_app/features/finance/widget/allregional/list.card.final.dart';
import 'package:nelongso_app/features/finance/widget/allregional/list.card.pph.dart';
import 'package:nelongso_app/features/finance/widget/allregional/list.card.share.dart';
import 'package:nelongso_app/features/finance/widget/allregional/list.card.weak.dart';

class AllRegionalScreen extends StatefulWidget {
  @override
  _AllRegionalScreenState createState() => _AllRegionalScreenState();
}

class _AllRegionalScreenState extends State<AllRegionalScreen> {
  final AllregionalBloc _bloc = AllregionalBloc();
  int yearSelected = 1;
  int monthSelected = 10;
  int sheetSelected = 1;
  List<String> yearLists = [
    null,
    '2020',
  ];
  List<String> monthLists = [
    null,
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
  ];
  List<String> sheetLists = [
    null,
    "DATA",
    "SHARE PROFIT & BEP",
    "MINGGU 1",
    "MINGGU 2",
    "MINGGU 3",
    "MINGGU 4",
    "MINGGU 5",
    "BIAYA TAMBAHAN",
    "FINAL",
    "PPH",
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
            title: "Scoreboard All Regional",
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
    List<RadioModel> months = monthLists.map((e) {
      var i = monthLists.indexOf(e);
      var title = '';
      switch (e) {
        case '1':
          title = 'Januari';
          break;
        case '2':
          title = 'Febuari';
          break;
        case '3':
          title = 'Maret';
          break;
        case '4':
          title = 'April';
          break;
        case '5':
          title = 'Mei';
          break;
        case '6':
          title = 'Juni';
          break;
        case '7':
          title = 'Juli';
          break;
        case '8':
          title = 'Agustus';
          break;
        case '9':
          title = 'September';
          break;
        case '10':
          title = 'Oktober';
          break;
        case '11':
          title = 'November';
          break;
        case '12':
          title = 'Desember';
          break;
        default:
      }

      return RadioModel(
        id: i,
        title: '$title',
        subtitle: 'month',
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
              data: months,
              title: 'Month',
              selected: monthSelected,
              onChange: (val) => setState(() => monthSelected = val),
            );

          case 3:
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
                child: Icon(Icons.calendar_today),
              ),
              Text('Month')
            ],
          ),
        ),
        PopupMenuItem(
          value: 3,
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
    List<int> check = [yearSelected, monthSelected, sheetSelected];
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
        _bloc.add(FetchAllData(
          year: yearLists[yearSelected],
          month: monthLists[monthSelected],
          sheet: sheetLists[sheetSelected],
        ));
      } else if (sheetSelected == 2) {
        _bloc.add(FetchAllShare(
          year: yearLists[yearSelected],
          month: monthLists[monthSelected],
          sheet: sheetLists[sheetSelected],
        ));
      } else if (sheetSelected == 3 ||
          sheetSelected == 4 ||
          sheetSelected == 5 ||
          sheetSelected == 6 ||
          sheetSelected == 7) {
        _bloc.add(FetchAllWeak(
          year: yearLists[yearSelected],
          month: monthLists[monthSelected],
          sheet: sheetLists[sheetSelected],
        ));
      } else if (sheetSelected == 8) {
        _bloc.add(FetchAllBiaya(
          year: yearLists[yearSelected],
          month: monthLists[monthSelected],
          sheet: sheetLists[sheetSelected],
        ));
      } else if (sheetSelected == 9) {
        _bloc.add(FetchAllFinal(
          year: yearLists[yearSelected],
          month: monthLists[monthSelected],
          sheet: sheetLists[sheetSelected],
        ));
      } else if (sheetSelected == 10) {
        _bloc.add(FetchAllPph(
          year: yearLists[yearSelected],
          month: monthLists[monthSelected],
          sheet: sheetLists[sheetSelected],
        ));
      }
      return BlocProvider(
        create: (_) => _bloc,
        child: BlocListener<AllregionalBloc, AllregionalState>(
          listener: (context, state) {
            final error =
                'Year ${yearLists[yearSelected]}, Month ${monthLists[monthSelected]}, Sheet ${sheetLists[sheetSelected]}';
            if (state is AllregionalError) {
              ToastCustom(context).showDefault(msg: state.message);
            } else if (state is! AllregionalInitial ||
                state is! AllregionalLoading) {
              ToastCustom(context).showDefault(msg: error.toString());
            }
          },
          child: BlocBuilder<AllregionalBloc, AllregionalState>(
            builder: (context, state) {
              if (state is AllregionalInitial) {
                return Center(child: LoadingPageIndicator());
              } else if (state is AllregionalLoading) {
                return Center(child: LoadingPageIndicator());
              } else if (state is AllregionalError) {
                return FailedHostView(state: state.message);
              } else if (state is AllregionalDataLoaded) {
                return ListCardData(
                  model: state.allregionalDataModel,
                  month: int.parse(monthLists[monthSelected]),
                  year: int.parse(yearLists[yearSelected]),
                );
              } else if (state is AllregionalShareLoaded) {
                return ListCardShare(
                  model: state.allregionalShareModel,
                  month: int.parse(monthLists[monthSelected]),
                  year: int.parse(yearLists[yearSelected]),
                );
              } else if (state is AllregionalWeakLoaded) {
                return ListCardWeak(
                  model: state.allregionalWeakModel,
                  month: int.parse(monthLists[monthSelected]),
                  year: int.parse(yearLists[yearSelected]),
                );
              } else if (state is AllregionalBiayaLoaded) {
                return ListCardBiaya(
                  model: state.allregionalBiayaModel,
                  month: int.parse(monthLists[monthSelected]),
                  year: int.parse(yearLists[yearSelected]),
                );
              } else if (state is AllregionalFinalLoaded) {
                return ListCardFinal(
                  model: state.allregionalFinalModel,
                  month: int.parse(monthLists[monthSelected]),
                  year: int.parse(yearLists[yearSelected]),
                );
              } else if (state is AllregionalPphLoaded) {
                return ListCardPph(
                  model: state.allregionalPphModel,
                  month: int.parse(monthLists[monthSelected]),
                  year: int.parse(yearLists[yearSelected]),
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      );
    }
  }
}
