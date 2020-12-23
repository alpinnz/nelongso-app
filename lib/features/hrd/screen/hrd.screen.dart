import 'package:flutter/material.dart';
import 'package:nelongso_app/core/utils/colors_util.dart';
import 'package:nelongso_app/core/utils/size_config.dart';
import 'package:nelongso_app/core/widget/basic.appbar.dart';
import 'package:nelongso_app/features/hrd/routes/hrd.route.dart';

class HrdScreen extends StatelessWidget {
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
            title: "HRD",
            titlecolor: ColorUtils.lightColor,
            onClickEvent: () => Navigator.of(context).pop(),
          ),
        ),
      ),
      body: HrdContent(),
    );
  }
}

class HrdContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void onPersonal() => RouteConfigHrd.navigatePersonal(context);
    void onPayroll() => RouteConfigHrd.navigatePayroll(context);
    void onRecruitment() => RouteConfigHrd.navigateRecruitment(context);
    void onAnalytics() => RouteConfigHrd.navigateAnalytics(context);

    return Container(
      child: Column(
        children: [
          _itemData('Personal Management', onPersonal, 'folder'),
          _itemData('Payroll', onPayroll, 'folder'),
          _itemData('Recruitment', onRecruitment, 'folder'),
          _itemData('HRD Analytics', onAnalytics, 'folder'),
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
