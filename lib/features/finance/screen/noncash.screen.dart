import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nelongso_app/core/utils/colors_util.dart';
import 'package:nelongso_app/core/widget/basic.appbar.dart';
import 'package:nelongso_app/core/widget/failed.host.view.dart';
import 'package:nelongso_app/core/widget/loading.page.indicator.dart';
import 'package:nelongso_app/features/finance/bloc/noncash_bloc.dart';
import 'package:nelongso_app/features/finance/widget/noncash/list.card.gojekandgrab.dart';
import 'package:nelongso_app/features/finance/widget/noncash/list.card.goresto.dart';
import 'package:nelongso_app/features/finance/widget/noncash/list.card.grabresto.dart';
import 'package:nelongso_app/features/finance/widget/noncash/list.card.saldogoresto.dart';
import 'package:nelongso_app/features/finance/widget/noncash/list.card.saldograbresto.dart';
import 'package:smart_select/smart_select.dart';

class NoncashScreen extends StatefulWidget {
  @override
  _NoncashScreenState createState() => _NoncashScreenState();
}

class _NoncashScreenState extends State<NoncashScreen> {
  final NoncashBloc _bloc = NoncashBloc();
  String yearValue = '2020';
  String sheetValue = 'GORESTO';
  String monthValue = '10';

  @override
  void initState() {
    _bloc.add(
      FetchAllGoresto(year: yearValue, sheet: sheetValue, month: monthValue),
    );
    super.initState();
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
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
            title: "Dashboard Non Cash",
            titlecolor: ColorUtils.lightColor,
            onClickEvent: () => Navigator.of(context).pop(),
            actions: <Widget>[
              Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.search,
                      size: 26.0,
                    ),
                  )),
              Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    onTap: () => _moreWidget(context),
                    child: Icon(Icons.more_vert),
                  )),
            ],
          ),
        ),
      ),
      body: _buildBloc(),
    );
  }

  void _showSnackBar(var text) {
    scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(text)));
  }

  void _moreWidget(BuildContext context) async {
    List<S2Choice<String>> yearOptions = [
      S2Choice<String>(value: '2020', title: '2020'),
      // S2Choice<String>(value: '2021', title: '2021'),
    ];

    List<S2Choice<String>> sheetOptions = [
      S2Choice<String>(value: 'GORESTO', title: 'GORESTO'),
      S2Choice<String>(value: 'GRABRESTO', title: 'GRABRESTO'),
      S2Choice<String>(value: 'GOJEK & GRAB', title: 'GOJEK & GRAB'),
      S2Choice<String>(value: 'SALDO GORESTO', title: 'SALDO GORESTO'),
      S2Choice<String>(value: 'SALDO GRABRESTO', title: 'SALDO GRABRESTO')
    ];

    List<S2Choice<String>> monthOptions = [
      S2Choice<String>(value: '1', title: 'Januari'),
      S2Choice<String>(value: '2', title: 'Febuari'),
      S2Choice<String>(value: '3', title: 'Maret'),
      S2Choice<String>(value: '4', title: 'April'),
      S2Choice<String>(value: '5', title: 'Mei'),
      S2Choice<String>(value: '6', title: 'Juni'),
      S2Choice<String>(value: '7', title: 'Juli'),
      S2Choice<String>(value: '8', title: 'Agustus'),
      S2Choice<String>(value: '9', title: 'September'),
      S2Choice<String>(value: '10', title: 'Oktober'),
      S2Choice<String>(value: '11', title: 'November'),
      S2Choice<String>(value: '12', title: 'Desember'),
    ];

    bool options = await showDialog(
      context: this.context,
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
              title: "More",
              titlecolor: ColorUtils.lightColor,
              onClickEvent: () => Navigator.pop(context, true),
            ),
          ),
        ),
        body: Container(
          child: Column(
            children: [
              SmartSelect<String>.single(
                title: 'Year',
                value: yearValue,
                choiceItems: yearOptions,
                onChange: (state) => setState(() => yearValue = state.value),
              ),
              SmartSelect<String>.single(
                title: 'SheetName',
                value: sheetValue,
                choiceItems: sheetOptions,
                onChange: (state) => setState(() => sheetValue = state.value),
              ),
              SmartSelect<String>.single(
                title: 'Month',
                value: monthValue,
                choiceItems: monthOptions,
                onChange: (state) => setState(() => sheetValue = state.value),
              )
            ],
          ),
        ),
      ),
    );
    print('options $options');
    setState(() {
      if (yearValue == '2020') {
        if (sheetValue == 'GORESTO') {
          _bloc.add(
            FetchAllGoresto(
                year: yearValue, sheet: sheetValue, month: monthValue),
          );
        } else if (sheetValue == 'GRABRESTO') {
          _bloc.add(
            FetchAllGrabresto(
                year: yearValue, sheet: sheetValue, month: monthValue),
          );
        } else if (sheetValue == 'GOJEK & GRAB') {
          _bloc.add(
            FetchAllGojekandgrab(
                year: yearValue, sheet: sheetValue, month: monthValue),
          );
        } else if (sheetValue == 'SALDO GRABRESTO') {
          _bloc.add(
            FetchAllSaldograbresto(
                year: yearValue, sheet: sheetValue, month: monthValue),
          );
        } else if (sheetValue == 'SALDO GORESTO') {
          _bloc.add(
            FetchAllSaldogoresto(
                year: yearValue, sheet: sheetValue, month: monthValue),
          );
        }
      } else {
        _showSnackBar('Year not found or data failure');
      }
    });
  }

  Widget _buildBloc() {
    return BlocProvider(
      create: (_) => _bloc,
      child: BlocListener<NoncashBloc, NoncashState>(
        listener: (context, state) {
          if (state is NoncashError) {
            _showSnackBar(state.message);
          } else if (state is NoncashGorestoLoaded) {
            _showSnackBar(
              'Load data Noncash: Year $yearValue, Sheet $sheetValue',
            );
          }
        },
        child: BlocBuilder<NoncashBloc, NoncashState>(
          builder: (context, state) {
            if (state is NoncashInitial) {
              return Center(child: LoadingPageIndicator());
            } else if (state is NoncashLoading) {
              return Center(child: LoadingPageIndicator());
            } else if (state is NoncashGorestoLoaded) {
              return ListCardGoresto(
                  model: state.noncashGoresto,
                  month: int.parse(monthValue),
                  year: int.parse(yearValue));
            } else if (state is NoncashGrabrestoLoaded) {
              return ListCardGrabresto(
                model: state.noncashGrabresto,
                month: int.parse(monthValue),
                year: int.parse(yearValue),
              );
            } else if (state is NoncashGojekandgrabLoaded) {
              return ListCardGojekandgrab(
                model: state.noncashGojekandgrabModel,
                month: int.parse(monthValue),
                year: int.parse(yearValue),
              );
            } else if (state is NoncashSaldograbrestoLoaded) {
              return ListCardSaldograbresto(
                model: state.noncashSaldograbresto,
                month: int.parse(monthValue),
                year: int.parse(yearValue),
              );
            }
            if (state is NoncashSaldogorestoLoaded) {
              return ListCardSaldogoresto(
                model: state.noncashSaldogoresto,
                month: int.parse(monthValue),
                year: int.parse(yearValue),
              );
            } else if (state is NoncashError) {
              return FailedHostView(state: state);
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
// ListCardGojekandgrab
