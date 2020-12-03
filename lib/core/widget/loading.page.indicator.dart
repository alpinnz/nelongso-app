import 'package:flutter/material.dart';
import 'package:nelongso_app/core/constant/Consts.dart';
import 'package:nelongso_app/core/utils/colors_util.dart';
import 'package:nelongso_app/core/utils/size_config.dart';

class LoadingPageIndicator extends StatelessWidget {
  final String message;

  LoadingPageIndicator({this.message = "Loading data.."});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: double.maxFinite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Image.asset(
            "${Constanta.IMAGE_ASSET}loading.gif",
            height: SizeConfig.imageSizeMultiplier * 20,
            width: SizeConfig.imageSizeMultiplier * 20,
            fit: BoxFit.contain,
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 5,
          ),
          Text(
            "$message",
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
