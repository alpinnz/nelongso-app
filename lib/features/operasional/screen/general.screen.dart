import 'package:flutter/material.dart';
import 'package:nelongso_app/core/utils/colors_util.dart';
import 'package:nelongso_app/core/utils/size_config.dart';
import 'package:nelongso_app/core/widget/basic.appbar.dart';
import 'package:nelongso_app/features/operasional/routes/operasional.route.dart';

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
            title: "General Affair & 5R",
            titlecolor: ColorUtils.lightColor,
            onClickEvent: () => Navigator.of(context).pop(),
          ),
        ),
      ),
      body: OperasionalContent(),
    );
  }
}

class OperasionalContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void onIventaris() =>
        RouteConfigOperasional.navigateOperasionalGeneralInventaris(context);
    void onCleaning() =>
        RouteConfigOperasional.navigateOperasionalGeneralCleaning(context);
    void onPenilaian() =>
        RouteConfigOperasional.navigateOperasionalGeneralPenilaian(context);

    return Container(
      child: Column(
        children: [
          _itemData('Iventaris', onIventaris, 'folder'),
          _itemData('General Cleaning', onCleaning, 'folder'),
          _itemData('Penilaian', onPenilaian, 'folder'),
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
