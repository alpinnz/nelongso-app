import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nelongso_app/core/utils/colors_util.dart';
import 'package:nelongso_app/core/utils/size_config.dart';
import 'package:nelongso_app/core/widget/basic.appbar.dart';
import 'package:nelongso_app/core/widget/failed.host.view.dart';
import 'package:nelongso_app/core/widget/loading.page.indicator.dart';
import 'package:nelongso_app/features/bisdev/bloc/investor_bloc.dart';
import 'package:nelongso_app/features/bisdev/model/investor.model.dart';
import 'package:nelongso_app/features/bisdev/routes/bisdev.route.dart';

class InvestorScreen extends StatefulWidget {
  @override
  _InvestorScreenState createState() => _InvestorScreenState();
}

class _InvestorScreenState extends State<InvestorScreen> {
  final InvestorBloc _bloc = InvestorBloc();

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
            title: "Investor Management",
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
      child: BlocListener<InvestorBloc, InvestorState>(
        listener: (context, state) {
          if (state is InvestorError) {
            _showSnackBar(state.message);
          } else if (state is InvestorLoaded) {
            _showSnackBar(
              'Load data Investor Management',
            );
          }
        },
        child: BlocBuilder<InvestorBloc, InvestorState>(
          builder: (context, state) {
            if (state is InvestorInitial) {
              return Center(child: LoadingPageIndicator());
            } else if (state is InvestorLoading) {
              return Center(child: LoadingPageIndicator());
            } else if (state is InvestorLoaded) {
              return _buildCard(context, state.listInvestor);
            } else if (state is InvestorError) {
              return FailedHostView(state: state);
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, List<InvestorModel> model) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: SizeConfig.heightMultiplier * 0.25,
        horizontal: SizeConfig.widthMultiplier * 0.5,
      ),
      child: ListView.builder(
        itemCount: model.length,
        itemBuilder: (BuildContext context, int index) {
          final data = model[index];
          print(data.outlets.length);
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
              title: Text('${data.namaMitra}'),
              subtitle: Text('${data.alamatMitra}'),
              onTap: () => onDetail(data),
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

  void onDetail(data) {
    RouteConfigBisdev.navigateBisdevInvestoDetail(context, data);
  }
}
