import 'package:flutter/material.dart';
import 'package:nelongso_app/core/utils/colors_util.dart';
import 'package:nelongso_app/core/widget/basic.appbar.dart';

class DialogCustom {
  final BuildContext context;
  DialogCustom(this.context);
  void selectRadioDialog({
    String title,
    int selected,
    List<RadioModel> data,
    VoidCallback onSelected,
    Function(dynamic) onChange,
  }) async {
    bool options = await showDialog(
      context: context,
      child: Scaffold(
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
              title: '$title',
              titlecolor: ColorUtils.lightColor,
              onClickEvent: () => Navigator.pop(context, true),
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            var e = data[index];
            if (e.id == 0) {
              return Container();
            } else {
              return Column(
                children: [
                  RadioListTile(
                    value: e.id,
                    groupValue: selected,
                    title: Text("${e.title}"),
                    subtitle: Text("${e.subtitle}"),
                    onChanged: (val) {
                      onChange(val);
                      Navigator.pop(context, true);
                    },
                    autofocus: e.id == selected,
                    activeColor: Colors.blueAccent,
                    selected: e.id == selected,
                  ),
                  Divider(
                    color: Colors.black87,
                  ),
                ],
              );
            }
          },
        ),
      ),
    );

    if (options) {
      // setState();
      // setState(() {});
    }
  }

  Widget build(BuildContext context) {
    return Container();
  }
}

class RadioModel {
  final int id;
  final String title;
  final String subtitle;
  final String value;
  const RadioModel({this.id, this.title, this.subtitle, this.value});
}
