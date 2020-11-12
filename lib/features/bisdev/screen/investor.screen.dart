import 'package:flutter/material.dart';
import 'package:nelongso_app/core/utils/colors_util.dart';
import 'package:nelongso_app/core/utils/size_config.dart';
import 'package:nelongso_app/core/widget/basic.appbar.dart';

class InvestorScreen extends StatelessWidget {
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
          ),
        ),
      ),
      body: InvestorContent(),
    );
  }
}

class InvestorContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
