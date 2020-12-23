import 'package:flutter/material.dart';
import 'package:nelongso_app/core/utils/colors_util.dart';
import 'package:nelongso_app/core/utils/size_config.dart';
import 'package:nelongso_app/core/widget/basic.appbar.dart';
import 'package:nelongso_app/features/bisdev/routes/bisdev.route.dart';
import 'package:nelongso_app/features/finance/routes/finance.route.dart';
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
            appbarType: AppbarType.BACK_BUTTON,
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

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void onBisdev() => RouteConfigBisdev.navigateBisdev(context);
    void onFinance() => RouteConfigFinance.navigateFinance(context);
    void onMarketing() => RouteConfigMarketing.navigateMarketing(context);
    void onOperasional() => RouteConfigOperasional.navigateOperasional(context);
    void onProduksi() => RouteConfigProduksi.navigateProduksi(context);
    void onHrd() => RouteConfigHrd.navigateHrd(context);
    return Container(
      child: Column(
        children: [
          _itemData('Bisdev', onBisdev),
          _itemData('Keuangan', onFinance),
          _itemData('Marketing', onMarketing),
          _itemData('HRD', onHrd),
          _itemData('Operasional', onOperasional),
          _itemData('Produksi', onProduksi),
        ],
      ),
    );
  }

  Widget _itemData(String _title, Function _onTap) {
    return ListTile(
      title: Text('$_title'),
      trailing: Icon(
        Icons.chevron_right,
        size: SizeConfig.imageSizeMultiplier * 9,
      ),
      leading: Icon(
        Icons.book,
        size: SizeConfig.imageSizeMultiplier * 9,
      ),
      subtitle: Text('divisi'),
      onTap: () => _onTap(),
    );
  }
}
