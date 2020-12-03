import 'package:flutter/material.dart';
import 'package:nelongso_app/core/utils/size_config.dart';

enum AppbarType { BACK_BUTTON, MENU, NOTHING }

class BasicAppbar extends StatefulWidget {
  final AppbarType appbarType;
  final Color bgcolor, titlecolor, colorAppbarType;
  final String title;
  final Function onClickEvent;
  final List<Widget> actions;
  final double elevation;
  final TabBar tabBar;

  BasicAppbar(
      {this.appbarType,
      this.elevation = 0.0,
      this.colorAppbarType = Colors.black,
      this.title,
      this.titlecolor = Colors.black,
      this.bgcolor = Colors.white,
      this.onClickEvent,
      this.actions,
      this.tabBar});

  @override
  State<StatefulWidget> createState() => BasicAppbarState();
}

class BasicAppbarState extends State<BasicAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      actionsIconTheme: IconThemeData(
        size: SizeConfig.imageSizeMultiplier * 6.25,
        color: Colors.black,
        opacity: 10.0,
      ),
      bottom: widget.tabBar != null ? widget.tabBar : null,
      elevation: widget.elevation,
      backgroundColor: widget.bgcolor,
      leading: Padding(
        padding: EdgeInsets.only(left: 0),
        child: (widget.appbarType == null)
            ?
            //  Image.asset(
            //     "${Constanta.IMAGE_ASSET}ic_appbar.png",
            //     height: 10,
            //     width: 10,

            //   )
            Icon(Icons.list)
            : leadingWidget(
                widget.appbarType,
              ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Flexible(
            child: Container(
              padding: EdgeInsets.only(
                right: 0,
              ),
              child: Text(
                widget.title,
                style: TextStyle(
                  color: widget.titlecolor,
                  fontWeight: FontWeight.w600,
                  fontSize: SizeConfig.imageSizeMultiplier * 5.0,
                ),
                overflow: TextOverflow.fade,
              ),
            ),
          )
        ],
      ),
      actions: widget.actions,
    );
  }

  Widget leadingWidget(AppbarType appbarType) {
    Color _colorAppbarType = widget.colorAppbarType;
    switch (appbarType) {
      case AppbarType.BACK_BUTTON:
        return IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: _colorAppbarType,
            size: SizeConfig.imageSizeMultiplier * 6.25,
          ),
          onPressed: () {
            widget.onClickEvent();
          },
        );

      case AppbarType.MENU:
        return IconButton(
          icon: Icon(
            Icons.menu,
            color: _colorAppbarType,
            size: SizeConfig.imageSizeMultiplier * 6.25,
          ),
          onPressed: () {
            widget.onClickEvent();
          },
        );

      case AppbarType.NOTHING:
        return null;

      default:
        return null;
    }
  }
}
