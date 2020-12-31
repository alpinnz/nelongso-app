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
import 'package:nelongso_app/features/bisdev/bloc/investor_bloc.dart';
import 'package:nelongso_app/features/bisdev/model/investor.model.dart';
import 'package:nelongso_app/features/bisdev/routes/bisdev.route.dart';

class InvestorScreen extends StatefulWidget {
  @override
  _InvestorScreenState createState() => _InvestorScreenState();
}

class _InvestorScreenState extends State<InvestorScreen> {
  final InvestorBloc _bloc = InvestorBloc();
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
            title: "Investor Management",
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
      child: BlocListener<InvestorBloc, InvestorState>(
        listener: (context, state) {
          final error = 'Year ${yearLists[yearSelected]}';
          if (state is InvestorError) {
            ToastCustom(context).showDefault(msg: state.message);
          } else if (state is InvestorLoaded) {
            ToastCustom(context).showDefault(msg: error.toString());
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
              return FailedHostView(state: state.message);
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
