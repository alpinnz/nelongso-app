import 'package:flutter/material.dart';
import 'package:nelongso_app/core/utils/colors_util.dart';
import 'package:nelongso_app/core/utils/size_config.dart';
import 'package:nelongso_app/core/widget/basic.appbar.dart';
import 'package:nelongso_app/features/bisdev/routes/bisdev.route.dart';
import 'package:nelongso_app/features/finance/routes/finance.route.dart';
import 'package:nelongso_app/features/marketing/routes/marketing.route.dart';

class MarketingScreen extends StatelessWidget {
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
            title: "Keuangan",
            titlecolor: ColorUtils.lightColor,
            onClickEvent: () => Navigator.of(context).pop(),
          ),
        ),
      ),
      body: MarketingContent(),
    );
  }
}

class MarketingContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void onSales() => RouteConfigMarketing.navigateMarketingSales(context);
    void onCustomer() =>
        RouteConfigMarketing.navigateMarketingCustomer(context);
    void onAnalytics() =>
        RouteConfigMarketing.navigateMarketingAnalytics(context);
    return Container(
      child: Column(
        children: [
          _itemData('Sales Optimization', onSales, 'folder'),
          _itemData('Customer Service', onCustomer, 'data'),
          _itemData('Analytics', onAnalytics, 'data'),
        ],
      ),
    );
  }

  Widget _itemData(String _title, Function _onTap, String _subtitle) {
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
      subtitle: Text('$_subtitle'),
      onTap: () => _onTap(),
    );
  }
}
