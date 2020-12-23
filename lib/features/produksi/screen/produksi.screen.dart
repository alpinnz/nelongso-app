import 'package:flutter/material.dart';
import 'package:nelongso_app/core/utils/colors_util.dart';
import 'package:nelongso_app/core/utils/size_config.dart';
import 'package:nelongso_app/core/widget/basic.appbar.dart';
import 'package:nelongso_app/features/produksi/routes/produksi.route.dart';

class ProduksiScreen extends StatelessWidget {
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
            title: "Produksi",
            titlecolor: ColorUtils.lightColor,
            onClickEvent: () => Navigator.of(context).pop(),
          ),
        ),
      ),
      body: ProduksiContent(),
    );
  }
}

class ProduksiContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void onLogistics() =>
        RouteConfigProduksi.navigateProduksiLogistics(context);
    void onMaterials() =>
        RouteConfigProduksi.navigateProduksiMaterials(context);
    void onQuality() => RouteConfigProduksi.navigateProduksiQuality(context);
    void onCentral() => RouteConfigProduksi.navigateProduksiCentral(context);
    void onOutlet() => RouteConfigProduksi.navigateProduksiOutlet(context);
    void onAnalytics() =>
        RouteConfigProduksi.navigateProduksiAnalytics(context);

    return Container(
      child: Column(
        children: [
          _itemData('Logistics', onLogistics, 'folder'),
          _itemData('Materials Management', onMaterials, 'folder'),
          _itemData('Quality Management', onQuality, 'folder'),
          _itemData('Central Kitchen Management', onCentral, 'folder'),
          _itemData('Outlet Profiles', onOutlet, 'folder'),
          _itemData('Analytics', onAnalytics, 'folder'),
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
