import 'package:flutter/material.dart';
import 'package:nelongso_app/core/utils/colors_util.dart';
import 'package:nelongso_app/core/utils/size_config.dart';
import 'package:nelongso_app/core/widget/basic.appbar.dart';
import 'package:nelongso_app/features/finance/routes/finance.route.dart';

class GeneralScreen extends StatelessWidget {
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
            title: "General Accounting",
            titlecolor: ColorUtils.lightColor,
            onClickEvent: () => Navigator.of(context).pop(),
          ),
        ),
      ),
      body: GeneralContent(),
    );
  }
}

class GeneralContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void onRegional() =>
        RouteConfigFinance.navigateFinanceGeneralRegional(context);
    void onNonCash() =>
        RouteConfigFinance.navigateFinanceGeneralNonCash(context);
    void onAllRegional() =>
        RouteConfigFinance.navigateFinanceGeneralAllRegional(context);
    return Container(
      child: Column(
        children: [
          _itemData('Dashboard Regional', onRegional),
          _itemData('Dashboard Non Cash', onNonCash),
          _itemData('Scoreboard All Regional', onAllRegional),
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
      subtitle: Text('data'),
      onTap: () => _onTap(),
    );
  }
}
