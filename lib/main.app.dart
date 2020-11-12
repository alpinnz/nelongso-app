import 'package:flutter/material.dart';
import 'package:nelongso_app/core/app.dart';
import 'package:nelongso_app/core/utils/colors_util.dart';
import 'package:nelongso_app/core/utils/size_config.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:nelongso_app/features/auth/screen/login.screen.dart';
import 'package:nelongso_app/features/init/screen/init.screen.dart';

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
              localizationsDelegates: [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              theme: ThemeData(
                primaryColor: ColorUtils.primaryColor,
                accentColor: ColorUtils.accentColor,
              ),
              title: 'Nelongso App',
              home: LoginScreen(),
              onGenerateRoute: App.main.router.generator(),
              navigatorKey: App.main.router.navigatorKey,
            );
          },
        );
      },
    );
  }
}
