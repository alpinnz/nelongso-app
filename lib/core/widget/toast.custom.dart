import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nelongso_app/core/utils/size_config.dart';

class ToastCustom {
  final BuildContext context;
  ToastCustom(this.context);
  Future<bool> showDefault({String msg}) {
    return Fluttertoast.showToast(
      msg: '$msg',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black54,
      textColor: Colors.white70,
      fontSize: SizeConfig.textMultiplier * 2,
    );
  }
}
