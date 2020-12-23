import 'package:flutter/material.dart';
import 'package:nelongso_app/core/utils/colors_util.dart';
import 'package:nelongso_app/core/utils/size_config.dart';
import 'package:nelongso_app/core/widget/basic.appbar.dart';
import 'package:nelongso_app/features/hrd/routes/hrd.route.dart';

class PersonalScreen extends StatelessWidget {
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
            title: "Personal Management",
            titlecolor: ColorUtils.lightColor,
            onClickEvent: () => Navigator.of(context).pop(),
          ),
        ),
      ),
      body: PersonalContent(),
    );
  }
}

class PersonalContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void onKaryawan() => RouteConfigHrd.navigatePersonalKaryawan(context);
    void onTunjangan() => RouteConfigHrd.navigatePersonalTunjangan(context);
    void onBpjs() => RouteConfigHrd.navigatePersonalBpjs(context);
    void onKasbon() => RouteConfigHrd.navigatePersonalKasbon(context);
    return Container(
      child: Column(
        children: [
          _itemData('Data Karyawan', onKaryawan, 'folder'),
          _itemData('Tunjangan Karyawan', onTunjangan, 'folder'),
          _itemData('BPJS', onBpjs, 'folder'),
          _itemData('Kasbon Karyawan', onKasbon, 'folder'),
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
