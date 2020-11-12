import 'package:flutter/material.dart';
import 'package:nelongso_app/core/utils/colors_util.dart';
import 'package:nelongso_app/core/utils/size_config.dart';
import 'package:nelongso_app/core/widget/basic.appbar.dart';
import 'package:nelongso_app/features/bisdev/routes/bisdev.route.dart';

class BisdevScreen extends StatelessWidget {
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
            title: "Bisdev",
            titlecolor: ColorUtils.lightColor,
            onClickEvent: () => Navigator.of(context).pop(),
          ),
        ),
      ),
      body: BisdevContent(),
    );
  }
}

class BisdevContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void onInvestor() => RouteConfigBisdev.navigateBisdevInvestor(context);
    void onOutlet() => RouteConfigBisdev.navigateBisdevOutlet(context);
    return Container(
      child: Column(
        children: [
          _itemData('Investor Mamangement', onInvestor),
          _itemData('Outlet Profiles', onOutlet),
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
