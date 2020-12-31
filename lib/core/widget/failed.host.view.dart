import 'package:flutter/material.dart';
import 'package:nelongso_app/core/utils/colors_util.dart';
import 'package:nelongso_app/core/utils/size_config.dart';

class FailedHostView extends StatelessWidget {
  final dynamic state;
  const FailedHostView({Key key, this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      color: Colors.transparent,
      width: double.maxFinite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
            state.message.contains("Failed host")
                ? "Tidak dapat menampilkan data, periksa koneksi Anda"
                : state.message,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: SizeConfig.textMultiplier * 3,
                fontWeight: FontWeight.w400,
                color: ColorUtils.grayColor),
          )
        ],
      ),
    );
  }
}
