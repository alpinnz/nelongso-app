import 'package:flutter/material.dart';
import 'package:nelongso_app/core/utils/colors_util.dart';
import 'package:nelongso_app/core/utils/size_config.dart';
import 'package:nelongso_app/core/widget/basic.appbar.dart';
import 'package:nelongso_app/features/produksi/routes/produksi.route.dart';

class MaterialsScreen extends StatelessWidget {
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
            title: "Materials Management",
            titlecolor: ColorUtils.lightColor,
            onClickEvent: () => Navigator.of(context).pop(),
          ),
        ),
      ),
      body: MaterialsContent(),
    );
  }
}

class MaterialsContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void onDashboard() =>
        RouteConfigProduksi.navigateProduksiMaterialsDashboard(context);
    void onGrup() => RouteConfigProduksi.navigateProduksiMaterialsGrup(context);
    void onOutlet() =>
        RouteConfigProduksi.navigateProduksiMaterialsDataOutlet(context);

    return Container(
      child: Column(
        children: [
          _itemData('Dashboard Pusat 1/2', onDashboard, 'folder'),
          _itemData('Grup Menu', onGrup, 'folder'),
          _itemData('Data Produksi Outlet', onOutlet, 'folder'),
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
