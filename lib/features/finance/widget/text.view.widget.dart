import 'package:flutter/material.dart';
import 'package:nelongso_app/core/utils/size_config.dart';

class TextViewWidget extends StatelessWidget {
  final String title;
  final String value;
  final double width;
  const TextViewWidget({Key key, this.title, this.value, this.width})
      : super(key: key);

  _convertToKapital(string) {
    return "${string.substring(0, 1).toUpperCase()}${string.substring(1).toLowerCase()}";
  }

  _convertToText(string) {
    return "$string".replaceAll('_', ' ');
  }

  @override
  Widget build(BuildContext context) {
    final _titleText = _convertToKapital(_convertToText('$title'));
    return Container(
      margin: EdgeInsets.only(top: SizeConfig.heightMultiplier * 0.25),
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.widthMultiplier * 1.25,
      ),
      child: Row(
        children: [
          Container(
            width: value != null ? width : 320,
            child: Text(
              _titleText,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 4),
            child: value != null ? Text(':') : null,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 0),
            child: value != null ? Text('$value') : null,
          ),
        ],
      ),
    );
  }
}
