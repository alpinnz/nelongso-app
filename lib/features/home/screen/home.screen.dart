import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nelongso_app/core/utils/colors_util.dart';
import 'package:nelongso_app/core/utils/size_config.dart';
import 'package:nelongso_app/core/widget/basic.appbar.dart';
import 'package:nelongso_app/core/widget/loading.page.indicator.dart';
import 'package:nelongso_app/core/widget/toast.custom.dart';
import 'package:nelongso_app/features/bisdev/routes/bisdev.route.dart';
import 'package:nelongso_app/features/finance/routes/finance.route.dart';
import 'package:nelongso_app/features/home/bloc/home_bloc.dart';
import 'package:nelongso_app/features/hrd/routes/hrd.route.dart';
import 'package:nelongso_app/features/marketing/routes/marketing.route.dart';
import 'package:nelongso_app/features/operasional/routes/operasional.route.dart';
import 'package:nelongso_app/features/produksi/routes/produksi.route.dart';

class HomeScreen extends StatelessWidget {
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
            appbarType: AppbarType.NOTHING,
            colorAppbarType: ColorUtils.whiteColor,
            bgcolor: ColorUtils.primaryColor,
            title: "Home",
            titlecolor: ColorUtils.lightColor,
            onClickEvent: () => Navigator.of(context).pop(),
          ),
        ),
      ),
      body: HomeContent(),
    );
  }
}

class HomeContent extends StatefulWidget {
  // ignore: close_sinks
  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  final HomeBloc _bloc = HomeBloc();

  @override
  void initState() {
    super.initState();
    _bloc.add(LoadEvent());
  }

  @override
  Widget build(BuildContext context) {
    void onBisdev() => RouteConfigBisdev.navigateBisdev(context);
    void onFinance() => RouteConfigFinance.navigateFinance(context);
    void onMarketing() => RouteConfigMarketing.navigateMarketing(context);
    void onOperasional() => RouteConfigOperasional.navigateOperasional(context);
    void onProduksi() => RouteConfigProduksi.navigateProduksi(context);
    void onHrd() => RouteConfigHrd.navigateHrd(context);

    Widget homeAdmin() {
      return Container(
        child: Column(
          children: [
            _itemData('Bisdev', onBisdev, true),
            _itemData('Keuangan', onFinance, true),
            _itemData('Marketing', onMarketing, true),
            _itemData('HRD', onHrd, true),
            _itemData('Operasional', onOperasional, true),
            _itemData('Produksi', onProduksi, true),
          ],
        ),
      );
    }

    Widget homeOwner() {
      return Container(
        child: Column(
          children: [
            _itemData('Bisdev', onBisdev, true),
            _itemData('Keuangan', onFinance, true),
            _itemData('Marketing', onMarketing, true),
            _itemData('HRD', onHrd, true),
            _itemData('Operasional', onOperasional, true),
            _itemData('Produksi', onProduksi, true),
          ],
        ),
      );
    }

    Widget homeCOBisdev() {
      return Container(
        child: Column(
          children: [
            _itemData('Bisdev', onBisdev, true),
            _itemData('Keuangan', onFinance, false),
            _itemData('Marketing', onMarketing, false),
            _itemData('HRD', onHrd, false),
            _itemData('Operasional', onOperasional, false),
            _itemData('Produksi', onProduksi, false),
          ],
        ),
      );
    }

    Widget homeCOFinance() {
      return Container(
        child: Column(
          children: [
            _itemData('Bisdev', onBisdev, false),
            _itemData('Keuangan', onFinance, true),
            _itemData('Marketing', onMarketing, false),
            _itemData('HRD', onHrd, false),
            _itemData('Operasional', onOperasional, false),
            _itemData('Produksi', onProduksi, false),
          ],
        ),
      );
    }

    Widget homeCOMarketing() {
      return Container(
        child: Column(
          children: [
            _itemData('Bisdev', onBisdev, false),
            _itemData('Keuangan', onFinance, false),
            _itemData('Marketing', onMarketing, true),
            _itemData('HRD', onHrd, false),
            _itemData('Operasional', onOperasional, false),
            _itemData('Produksi', onProduksi, false),
          ],
        ),
      );
    }

    Widget homeCOHrd() {
      return Container(
        child: Column(
          children: [
            _itemData('Bisdev', onBisdev, false),
            _itemData('Keuangan', onFinance, false),
            _itemData('Marketing', onMarketing, false),
            _itemData('HRD', onHrd, true),
            _itemData('Operasional', onOperasional, false),
            _itemData('Produksi', onProduksi, false),
          ],
        ),
      );
    }

    Widget homeCOOperasional() {
      return Container(
        child: Column(
          children: [
            _itemData('Bisdev', onBisdev, false),
            _itemData('Keuangan', onFinance, false),
            _itemData('Marketing', onMarketing, false),
            _itemData('HRD', onHrd, false),
            _itemData('Operasional', onOperasional, true),
            _itemData('Produksi', onProduksi, false),
          ],
        ),
      );
    }

    Widget homeCOProduksi() {
      return Container(
        child: Column(
          children: [
            _itemData('Bisdev', onBisdev, false),
            _itemData('Keuangan', onFinance, false),
            _itemData('Marketing', onMarketing, false),
            _itemData('HRD', onHrd, false),
            _itemData('Operasional', onOperasional, false),
            _itemData('Produksi', onProduksi, true),
          ],
        ),
      );
    }

    Widget homeUser() {
      return Container(
        child: Column(
          children: [
            _itemData('Bisdev', onBisdev, false),
            _itemData('Keuangan', onFinance, false),
            _itemData('Marketing', onMarketing, false),
            _itemData('HRD', onHrd, false),
            _itemData('Operasional', onOperasional, false),
            _itemData('Produksi', onProduksi, true),
          ],
        ),
      );
    }

    return BlocProvider(
      create: (_) => _bloc,
      child: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is HomeError) {
            ToastCustom(context).showDefault(msg: state.message);
          }
        },
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return Center(child: LoadingPageIndicator());
            }
            if (state is HomeInitial) {
              return Center(child: LoadingPageIndicator());
            }
            if (state is HomeAdmin) {
              return homeAdmin();
            }
            if (state is HomeOwner) {
              return homeOwner();
            }
            if (state is HomeCOBisdev) {
              return homeCOBisdev();
            }
            if (state is HomeCOFinance) {
              return homeCOFinance();
            }
            if (state is HomeCOMarketing) {
              return homeCOMarketing();
            }
            if (state is HomeCOHrd) {
              return homeCOHrd();
            }
            if (state is HomeCOOperasional) {
              return homeCOOperasional();
            }
            if (state is HomeCOProduksi) {
              return homeCOProduksi();
            }
            if (state is HomeUser) {
              return homeUser();
            }
            if (state is HomeError) {
              return Center(
                child: Text(state.message.toString()),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  Widget _itemData(String _title, Function _onTap, bool enabled) {
    return ListTile(
      title: Text('$_title'),
      trailing: enabled
          ? Icon(
              Icons.chevron_right,
              size: SizeConfig.imageSizeMultiplier * 9,
            )
          : null,
      leading: Icon(
        Icons.book,
        size: SizeConfig.imageSizeMultiplier * 9,
      ),
      subtitle: Text('divisi'),
      onTap: enabled ? () => _onTap() : () => null,
      enabled: enabled,
    );
  }
}
