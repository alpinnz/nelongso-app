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
import 'package:nelongso_app/features/bisdev/bloc/outlet_bloc.dart';
import 'package:nelongso_app/features/bisdev/model/outlet.model.dart';

class OutletScreen extends StatefulWidget {
  @override
  _OutletScreenState createState() => _OutletScreenState();
}

class _OutletScreenState extends State<OutletScreen> {
  final OutletBloc _bloc = OutletBloc();
  int yearSelected;

  @override
  void initState() {
    super.initState();
    yearSelected = 0;
  }

  List<String> yearLists = [null, '2020', '2021'];

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
            title: "Outlet Profile",
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
      ],
    );
  }

  Widget _buildBloc() {
    List<int> check = [yearSelected];
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
      _bloc.add(FetchAll(
        year: yearLists[yearSelected],
      ));
    }
    return BlocProvider(
      create: (_) => _bloc,
      child: BlocListener<OutletBloc, OutletState>(
        listener: (context, state) {
          final error = 'Year ${yearLists[yearSelected]}';
          if (state is OutletError) {
            ToastCustom(context).showDefault(msg: state.message);
          } else if (state is OutletLoaded) {
            ToastCustom(context).showDefault(msg: error.toString());
          }
        },
        child: BlocBuilder<OutletBloc, OutletState>(
          builder: (context, state) {
            if (state is OutletInitial) {
              return Center(child: LoadingPageIndicator());
            } else if (state is OutletLoading) {
              return Center(child: LoadingPageIndicator());
            } else if (state is OutletLoaded) {
              return _buildCard(context, state.listOutlet);
            } else if (state is OutletError) {
              return FailedHostView(state: state.message);
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, List<OutletModel> model) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: SizeConfig.heightMultiplier * 0.25,
        horizontal: SizeConfig.widthMultiplier * 0.5,
      ),
      child: ListView.builder(
        itemCount: model.length,
        itemBuilder: (BuildContext context, int index) {
          final data = model[index];
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
              title: Text('${data.namaOutlet}'),
              subtitle: Text('${data.regional}'),
              onTap: () => _onTap(context, data),
              leading: Icon(
                Icons.person,
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

  Widget _textView(String _key, String _value) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: SizeConfig.heightMultiplier * 0.5,
      ),
      child: Row(
        children: [
          Container(
            width: SizeConfig.widthMultiplier * 24,
            child: Text(
              '$_key',
              style: TextStyle(
                fontSize: SizeConfig.textMultiplier * 2,
                color: ColorUtils.md_black_1000,
                decoration: TextDecoration.none,
              ),
            ),
          ),
          Text(
            ':',
            style: TextStyle(
              fontSize: SizeConfig.textMultiplier * 2,
              color: ColorUtils.textGreyColor,
              decoration: TextDecoration.none,
            ),
          ),
          Flexible(
            child: Text(
              '$_value',
              style: TextStyle(
                fontSize: SizeConfig.textMultiplier * 2,
                color: ColorUtils.textGreyColor,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onTap(context, OutletModel _data) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black45,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        return Center(
          child: Container(
            width: SizeConfig.widthMultiplier * 95,
            height: SizeConfig.heightMultiplier * 75,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: ColorUtils.bgColor,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.01),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _textView('Keterangan', _data.keterangan),
                  _textView('Nama Outlet', _data.namaOutlet),
                  _textView('Brand', _data.brand),
                  _textView('Regional', _data.regional),
                  _textView('Status', _data.status),
                  _textView('Aplikasi', _data.alamat),
                  _textView('Harga', _data.harga),
                  _textView('Alamat', _data.alamat),
                  _textView('Nama Manager', _data.namaManager),
                  _textView('Nama Mitra', _data.namaMitra),
                  _textView('Tanggal Grand Opening', _data.tanggalGrandOpening),
                  _textView(
                      'TanggalTerakhir Bayar', _data.tanggalTerakhirBayar),
                  _textView('Tanggal Jatuh Tempo', _data.tanggalJatuhTempo),
                  _textView('Recheck', _data.recheck),
                  _textView('Rab Total', _data.rabTotal),
                  _textView('Harga Sewa Tuko Per ahun', _data.harga),
                  _textView('Biaya Lainnya', _data.biayaLainnya),
                  _textView('Share Profit Nelongso', _data.bepNelongso),
                  _textView('Share Profit Mitra', _data.shareProfitMitra),
                  _textView('Status Bep', _data.statusBep),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
