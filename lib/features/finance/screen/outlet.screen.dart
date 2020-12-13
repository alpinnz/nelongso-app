import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nelongso_app/core/utils/colors_util.dart';
import 'package:nelongso_app/core/utils/size_config.dart';
import 'package:nelongso_app/core/widget/basic.appbar.dart';
import 'package:nelongso_app/core/widget/failed.host.view.dart';
import 'package:nelongso_app/core/widget/loading.page.indicator.dart';
import 'package:nelongso_app/features/finance/bloc/outlet_bloc.dart';
import 'package:nelongso_app/features/finance/model/outlet.model.dart';

class OutletScreen extends StatefulWidget {
  @override
  _OutletScreenState createState() => _OutletScreenState();
}

class _OutletScreenState extends State<OutletScreen> {
  final OutletBloc _bloc = OutletBloc();

  @override
  void initState() {
    _bloc.add(FetchAll());
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
            title: "Outlet Profiles",
            titlecolor: ColorUtils.lightColor,
            onClickEvent: () => Navigator.of(context).pop(),
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

  Widget _buildBloc() {
    return BlocProvider(
      create: (_) => _bloc,
      child: BlocListener<OutletBloc, OutletState>(
        listener: (context, state) {
          if (state is OutletError) {
            _showSnackBar(state.message);
          } else if (state is OutletLoaded) {
            _showSnackBar(
              'Load data Outlet Profiles',
            );
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
              return FailedHostView(state: state);
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
              title: Text('${data.outlet}'),
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
                  _textView('Outlet', _data.outlet),
                  _textView('Brand', _data.brand),
                  _textView('Regional', _data.regional),
                  _textView('Status', _data.status),
                  _textView('Jenis', _data.jenis),
                  _textView('Aplikasi', _data.aplikasi),
                  _textView('Biaya Lainnya', _data.biayaLainnya),
                  _textView('Share Profit Nelongso', _data.bepNelongso),
                  _textView('Share Profit Mitra', _data.shareProfitMitra),
                  _textView('Status Bep', _data.statusBep),
                  _textView('Bep Nelongso', _data.bepNelongso),
                  _textView('Bep Mitra', _data.bepMitra),
                  _textView('PPN', _data.statusBep),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
