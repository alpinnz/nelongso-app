import 'package:flutter/material.dart';
import 'package:nelongso_app/core/app.dart';
import 'package:nelongso_app/core/utils/colors_util.dart';
import 'package:nelongso_app/core/utils/size_config.dart';

import 'package:nelongso_app/features/home/screen/home.screen.dart';

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            App().init();
            return MaterialApp(
              theme: ThemeData(
                primaryColor: ColorUtils.primaryColor,
                accentColor: ColorUtils.accentColor,
              ),
              title: 'Nelongso App',
              home: HomeScreen(),
              onGenerateRoute: App.main.router.generator(),
              navigatorKey: App.main.router.navigatorKey,
            );
          },
        );
      },
    );
  }
}
