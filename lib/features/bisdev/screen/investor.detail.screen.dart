import 'package:flutter/material.dart';
import 'package:nelongso_app/core/utils/colors_util.dart';
import 'package:nelongso_app/core/utils/size_config.dart';
import 'package:nelongso_app/core/widget/basic.appbar.dart';
import 'package:nelongso_app/features/bisdev/model/investor.model.dart';
import 'package:sailor/sailor.dart';

class InvestorDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = Sailor.param<InvestorModel>(context, 'data');
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
            title: "Detail",
            titlecolor: ColorUtils.lightColor,
            onClickEvent: () => Navigator.of(context).pop(),
          ),
        ),
      ),
      body: _buildContent(context, data),
    );
  }

  Widget _buildContent(BuildContext context, InvestorModel _data) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: SizeConfig.heightMultiplier * 1,
        horizontal: SizeConfig.widthMultiplier * 2,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _textView('Nama', _data.namaMitra),
            _textView('NIK', _data.nik),
            _textView('NPWP', _data.npwp),
            _textView('Alamat', _data.alamatMitra),
            _textView('No Rekening', _data.noRekening),
            _textView('AN Rekening', _data.anRekening),
            _textView('Bank', _data.bank),
            _textView('Outlets', _data.outlets.length.toString()),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: SizeConfig.heightMultiplier * 1,
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text('List Outlets'),
                  ),
                  ListView.builder(
                    itemCount: _data.outlets.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      final data = _data.outlets[index];
                      // return Text(data.namaOutlet);
                      return ListTile(
                        title: Text('${data.namaOutlet}'),
                        subtitle: Text('${data.alamat}'),
                        onTap: () => _onTap(context, data),
                        leading: Icon(
                          Icons.business_center_outlined,
                          size: SizeConfig.imageSizeMultiplier * 10,
                          color: ColorUtils.primaryTextColor,
                        ),
                        trailing: Icon(
                          Icons.chevron_right,
                          size: SizeConfig.imageSizeMultiplier * 10,
                          color: ColorUtils.primaryTextColor,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _textView(String _key, String _value) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: SizeConfig.heightMultiplier * 0.5,
      ),
      child: Row(
        children: [
          Container(
            width: SizeConfig.widthMultiplier * 24,
            child: Text(
              '$_key',
              style: TextStyle(
                fontSize: SizeConfig.textMultiplier * 2,
                color: ColorUtils.md_black_1000,
                decoration: TextDecoration.none,
              ),
            ),
          ),
          Text(
            ':',
            style: TextStyle(
              fontSize: SizeConfig.textMultiplier * 2,
              color: ColorUtils.textGreyColor,
              decoration: TextDecoration.none,
            ),
          ),
          Flexible(
            child: Text(
              '$_value',
              style: TextStyle(
                fontSize: SizeConfig.textMultiplier * 2,
                color: ColorUtils.textGreyColor,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onTap(context, Outlets _data) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black45,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        return Center(
          child: Container(
            width: SizeConfig.widthMultiplier * 95,
            height: SizeConfig.heightMultiplier * 75,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: ColorUtils.bgColor,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.01),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _textView('Keterangan', _data.keterangan),
                  _textView('Nama Outlet', _data.namaOutlet),
                  _textView('Brand', _data.brand),
                  _textView('Regional', _data.regional),
                  _textView('Status', _data.status),
                  _textView('Aplikasi', _data.alamat),
                  _textView('Harga', _data.harga),
                  _textView('Alamat', _data.alamat),
                  _textView('Nama Manager', _data.namaManager),
                  _textView('Nama Mitra', _data.namaMitra),
                  _textView('Tanggal Grand Opening', _data.tanggalGrandOpening),
                  _textView(
                      'TanggalTerakhir Bayar', _data.tanggalTerakhirBayar),
                  _textView('Tanggal Jatuh Tempo', _data.tanggalJatuhTempo),
                  _textView('Recheck', _data.recheck),
                  _textView('Rab Total', _data.rabTotal),
                  _textView('Harga Sewa Tuko Per ahun', _data.harga),
                  _textView('Biaya Lainnya', _data.biayaLainnya),
                  _textView('Share Profit Nelongso', _data.bepNelongso),
                  _textView('Share Profit Mitra', _data.shareProfitMitra),
                  _textView('Status Bep', _data.statusBep),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
