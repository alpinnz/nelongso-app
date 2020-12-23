import 'package:flutter/material.dart';
import 'package:nelongso_app/core/utils/colors_util.dart';
import 'package:nelongso_app/core/utils/size_config.dart';
import 'package:nelongso_app/core/widget/basic.appbar.dart';
import 'package:nelongso_app/features/hrd/routes/hrd.route.dart';

class RecruitmentScreen extends StatelessWidget {
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
            title: "Recruitment",
            titlecolor: ColorUtils.lightColor,
            onClickEvent: () => Navigator.of(context).pop(),
          ),
        ),
      ),
      body: RecruitmentContent(),
    );
  }
}

class RecruitmentContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void onSdm() => RouteConfigHrd.navigateRecruitmentSdm(context);
    void onPelamar() => RouteConfigHrd.navigateRecruitmentPelamar(context);
    void onSeleksi() => RouteConfigHrd.navigateRecruitmentSeleksi(context);
    void onInterview() => RouteConfigHrd.navigateRecruitmentInterview(context);

    return Container(
      child: Column(
        children: [
          _itemData('Data Kebutuhan SDM', onSdm, 'folder'),
          _itemData('Data Pelamar Masuk', onPelamar, 'folder'),
          _itemData('Seleksi Pelamar', onSeleksi, 'folder'),
          _itemData('Hasil Interview', onInterview, 'folder'),
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
