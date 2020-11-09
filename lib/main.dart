import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:nelongso_app/core/app.dart';
import 'package:nelongso_app/main.app.dart';
import 'package:sailor/sailor.dart';

Future<Null> main() async {
  GetIt.instance.registerSingleton<App>(App.configure(router: Sailor()));

  WidgetsFlutterBinding.ensureInitialized();

  await GetIt.instance.get<App>().init();

  /*runApp(BlocProvider<LoggedInBloc>(
    create: (context) => LoggedInBloc(userRepo: UserRepository()),
    child: MainApp(),
  ));*/

  runApp(MainApp());
}
