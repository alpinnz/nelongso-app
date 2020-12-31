import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nelongso_app/core/utils/colors_util.dart';
import 'package:nelongso_app/core/utils/size_config.dart';
import 'package:nelongso_app/core/widget/basic.appbar.dart';
import 'package:nelongso_app/core/widget/dialog.custom.dart';
import 'package:nelongso_app/core/widget/failed.host.view.dart';
import 'package:nelongso_app/core/widget/loading.page.indicator.dart';
import 'package:nelongso_app/core/widget/toast.custom.dart';
import 'package:nelongso_app/features/marketing/bloc/ketercapaian_bloc.dart';
import 'package:nelongso_app/features/marketing/widget/ketercapaian/list.card.allregional.dart';
import 'package:nelongso_app/features/marketing/widget/ketercapaian/list.card.basket.dart';
import 'package:nelongso_app/features/marketing/widget/ketercapaian/list.card.kunjungan.dart';
import 'package:nelongso_app/features/marketing/widget/ketercapaian/list.card.omzet.dart';
import 'package:nelongso_app/features/marketing/widget/ketercapaian/list.card.outlet.dart';
import 'package:nelongso_app/features/marketing/widget/ketercapaian/list.card.regional.dart';
import 'package:nelongso_app/features/marketing/widget/ketercapaian/list.card.selisih.dart';

class SalesKetercapaianScreen extends StatefulWidget {
  @override
  _SalesKetercapaianScreenState createState() =>
      _SalesKetercapaianScreenState();
}

class _SalesKetercapaianScreenState extends State<SalesKetercapaianScreen> {
  final KetercapaianBloc _bloc = KetercapaianBloc();
  int yearSelected;
  int monthSelected;
  int sheetSelected;

  @override
  void initState() {
    super.initState();
    yearSelected = 0;
    monthSelected = 0;
    sheetSelected = 0;
  }

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
    "KETERCAPAIAN OMZET",
    "KETERCAPAIAN KUNJUNGAN",
    "KETERCAPAIAN BASKET SIZE",
    "KETERCAPAIAN JATIM 1",
    "KETERCAPAIAN JATIM 2",
    "KETERCAPAIAN JATIM 3",
    "KETERCAPAIAN JABAR",
    "KETERCAPAIAN ALL REGIONAL",
    "BULAN SEBELUM VS BULAN SEKARANG",
    "KESEHATAN OUTLET",
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
            title: "Data Ketercapaian",
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
        _bloc.add(FetchGetOmzet(
          year: yearLists[yearSelected],
          month: monthLists[monthSelected],
          sheet: sheetLists[sheetSelected],
        ));
      } else if (sheetSelected == 2) {
        _bloc.add(FetchGetKunjungan(
          year: yearLists[yearSelected],
          month: monthLists[monthSelected],
          sheet: sheetLists[sheetSelected],
        ));
      } else if (sheetSelected == 3) {
        _bloc.add(FetchGetBasket(
          year: yearLists[yearSelected],
          month: monthLists[monthSelected],
          sheet: sheetLists[sheetSelected],
        ));
      } else if (sheetSelected == 4 ||
          sheetSelected == 5 ||
          sheetSelected == 6 ||
          sheetSelected == 7) {
        _bloc.add(FetchGetRegional(
          year: yearLists[yearSelected],
          month: monthLists[monthSelected],
          sheet: sheetLists[sheetSelected],
        ));
      } else if (sheetSelected == 8) {
        _bloc.add(FetchGetAllregional(
          year: yearLists[yearSelected],
          month: monthLists[monthSelected],
          sheet: sheetLists[sheetSelected],
        ));
      } else if (sheetSelected == 9) {
        _bloc.add(FetchGetSelisih(
          year: yearLists[yearSelected],
          month: monthLists[monthSelected],
          sheet: sheetLists[sheetSelected],
        ));
      } else if (sheetSelected == 10) {
        _bloc.add(FetchGetOutlet(
          year: yearLists[yearSelected],
          month: monthLists[monthSelected],
          sheet: sheetLists[sheetSelected],
        ));
      }
      return BlocProvider(
        create: (_) => _bloc,
        child: BlocListener<KetercapaianBloc, KetercapaianState>(
          listener: (context, state) {
            if (state is KetercapaianError) {
              ToastCustom(context).showDefault(msg: state.message);
            }
          },
          child: BlocBuilder<KetercapaianBloc, KetercapaianState>(
            builder: (context, state) {
              if (state is KetercapaianInitial) {
                return Center(child: LoadingPageIndicator());
              } else if (state is KetercapaianLoading) {
                return Center(child: LoadingPageIndicator());
              } else if (state is KetercapaianError) {
                return FailedHostView(state: state);
              } else if (state is KetercapaianOmzetLoaded) {
                return ListCardOmzet(
                  model: state.data,
                  month: int.parse(monthLists[monthSelected]),
                  year: int.parse(yearLists[yearSelected]),
                );
              } else if (state is KetercapaianAllregionalLoaded) {
                return ListCardAllregional(
                  model: state.data,
                  month: int.parse(monthLists[monthSelected]),
                  year: int.parse(yearLists[yearSelected]),
                );
              } else if (state is KetercapaianBasketLoaded) {
                return ListCardBasket(
                  model: state.data,
                  month: int.parse(monthLists[monthSelected]),
                  year: int.parse(yearLists[yearSelected]),
                );
              } else if (state is KetercapaianKunjunganLoaded) {
                return ListCardKunjungan(
                  model: state.data,
                  month: int.parse(monthLists[monthSelected]),
                  year: int.parse(yearLists[yearSelected]),
                );
              } else if (state is KetercapaianOutletLoaded) {
                return ListCardOutlet(
                  model: state.data,
                  month: int.parse(monthLists[monthSelected]),
                  year: int.parse(yearLists[yearSelected]),
                );
              } else if (state is KetercapaianRegionalLoaded) {
                return ListCardRegional(
                  model: state.data,
                  month: int.parse(monthLists[monthSelected]),
                  year: int.parse(yearLists[yearSelected]),
                );
              } else if (state is KetercapaianSelisihLoaded) {
                return ListCardSelisih(
                  model: state.data,
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
