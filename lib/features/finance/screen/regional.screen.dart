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
import 'package:nelongso_app/features/finance/bloc/regional_bloc.dart';
import 'package:nelongso_app/features/finance/widget/regional/list.card.hpp.dart';
import 'package:nelongso_app/features/finance/widget/regional/list.card.kunjungan.dart';
import 'package:nelongso_app/features/finance/widget/regional/list.card.menu.dart';
import 'package:nelongso_app/features/finance/widget/regional/list.card.omzetofflineandonline.dart';
import 'package:nelongso_app/features/finance/widget/regional/list.card.omzetpershift.dart';
import 'package:nelongso_app/features/finance/widget/regional/list.card.operasional.dart';
import 'package:nelongso_app/features/finance/widget/regional/list.card.outlet.dart';
import 'package:nelongso_app/features/finance/widget/regional/list.card.persentasekunjungan.dart';

class RegionalScreen extends StatefulWidget {
  @override
  _RegionalScreenState createState() => _RegionalScreenState();
}

class _RegionalScreenState extends State<RegionalScreen> {
  final RegionalBloc _bloc = RegionalBloc();
  int yearSelected;
  int monthSelected;
  int sheetSelected;
  int regionalSelected;
  @override
  void initState() {
    super.initState();
    yearSelected = 0;
    monthSelected = 0;
    sheetSelected = 0;
    regionalSelected = 0;
  }

  List<String> regionalLists = [
    null,
    'jabar',
    'jatim1',
    'jatim2',
    'jatim3',
  ];
  List<String> yearLists = [null, '2020', '2021'];
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
    "REKAP OUTLET BULANAN",
    "REKAP HPP SUPPLIER",
    "REKAP OMZET OFFLINE & ONLINE",
    "REKAP KUNJUNGAN",
    "PERSENTASE KUNJUNGAN",
    "REKAP OPERASIONAL",
    "REKAP OMZET PER SHIFT",
    "REKAP MENU YANG TERJUAL",
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
            title: "Dashboard Regional",
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

    List<RadioModel> regionals = regionalLists.map((e) {
      var i = regionalLists.indexOf(e);
      return RadioModel(
        id: i,
        title: '$e',
        subtitle: 'regional',
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

          case 4:
            return DialogCustom(context).selectRadioDialog(
              data: regionals,
              title: 'Regionals',
              selected: regionalSelected,
              onChange: (val) => setState(() => regionalSelected = val),
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
        PopupMenuItem(
          value: 4,
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(2, 2, 8, 2),
                child: Icon(Icons.local_activity),
              ),
              Text('Regional')
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBloc() {
    List<int> check = [
      yearSelected,
      monthSelected,
      sheetSelected,
      regionalSelected
    ];
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
        _bloc.add(FetchAllOutlet(
          regional: regionalLists[regionalSelected],
          year: yearLists[yearSelected],
          month: monthLists[monthSelected],
          sheet: sheetLists[sheetSelected],
        ));
      } else if (sheetSelected == 2) {
        _bloc.add(FetchAllHpp(
          regional: regionalLists[regionalSelected],
          year: yearLists[yearSelected],
          month: monthLists[monthSelected],
          sheet: sheetLists[sheetSelected],
        ));
      } else if (sheetSelected == 3) {
        _bloc.add(FetchAllOmzetofflineandonline(
          regional: regionalLists[regionalSelected],
          year: yearLists[yearSelected],
          month: monthLists[monthSelected],
          sheet: sheetLists[sheetSelected],
        ));
      } else if (sheetSelected == 4) {
        _bloc.add(FetchAllKunjungan(
          regional: regionalLists[regionalSelected],
          year: yearLists[yearSelected],
          month: monthLists[monthSelected],
          sheet: sheetLists[sheetSelected],
        ));
      } else if (sheetSelected == 5) {
        _bloc.add(FetchAllPersentasekunjungan(
          regional: regionalLists[regionalSelected],
          year: yearLists[yearSelected],
          month: monthLists[monthSelected],
          sheet: sheetLists[sheetSelected],
        ));
      } else if (sheetSelected == 6) {
        _bloc.add(FetchAllOperasional(
          regional: regionalLists[regionalSelected],
          year: yearLists[yearSelected],
          month: monthLists[monthSelected],
          sheet: sheetLists[sheetSelected],
        ));
      } else if (sheetSelected == 7) {
        _bloc.add(FetchAllOmzetpershift(
          regional: regionalLists[regionalSelected],
          year: yearLists[yearSelected],
          month: monthLists[monthSelected],
          sheet: sheetLists[sheetSelected],
        ));
      } else if (sheetSelected == 8) {
        _bloc.add(FetchAllMenu(
          regional: regionalLists[regionalSelected],
          year: yearLists[yearSelected],
          month: monthLists[monthSelected],
          sheet: sheetLists[sheetSelected],
        ));
      }
      return BlocProvider(
        create: (_) => _bloc,
        child: BlocListener<RegionalBloc, RegionalState>(
          listener: (context, state) {
            if (state is RegionalError) {
              ToastCustom(context).showDefault(msg: state.message);
            }
          },
          child: BlocBuilder<RegionalBloc, RegionalState>(
            builder: (context, state) {
              if (state is RegionalInitial) {
                return Center(child: LoadingPageIndicator());
              } else if (state is RegionalLoading) {
                return Center(child: LoadingPageIndicator());
              } else if (state is RegionalError) {
                return FailedHostView(state: state);
              } else if (state is RegionalOutletLoaded) {
                return ListCardOutlet(
                  model: state.regionalOutlet,
                  month: int.parse(monthLists[monthSelected]),
                  year: int.parse(yearLists[yearSelected]),
                );
              } else if (state is RegionalHppLoaded) {
                return ListCardHpp(
                  model: state.regionalHpp,
                  month: int.parse(monthLists[monthSelected]),
                  year: int.parse(yearLists[yearSelected]),
                );
              } else if (state is RegionalOmzetofflineandonlineLoaded) {
                return ListCardOmzetofflineandonline(
                  model: state.regionalOmzetofflineandonline,
                  month: int.parse(monthLists[monthSelected]),
                  year: int.parse(yearLists[yearSelected]),
                );
              } else if (state is RegionalKunjunganLoaded) {
                return ListCardKunjungan(
                  model: state.regionalKunjungan,
                  month: int.parse(monthLists[monthSelected]),
                  year: int.parse(yearLists[yearSelected]),
                );
              } else if (state is RegionalPersentasekunjunganLoaded) {
                return ListCardPersentasekunjungan(
                  model: state.regionalPersentaseKunjungan,
                  month: int.parse(monthLists[monthSelected]),
                  year: int.parse(yearLists[yearSelected]),
                );
              } else if (state is RegionalOperasionalLoaded) {
                return ListCardOperasional(
                  model: state.regionalOperasional,
                  month: int.parse(monthLists[monthSelected]),
                  year: int.parse(yearLists[yearSelected]),
                );
              } else if (state is RegionalOmzetpershiftLoaded) {
                return ListCardOmzetpershift(
                  model: state.regionalOmzetpershift,
                  month: int.parse(monthLists[monthSelected]),
                  year: int.parse(yearLists[yearSelected]),
                );
              } else if (state is RegionalMenuLoaded) {
                return ListCardMenu(
                  model: state.regionalMenu,
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
