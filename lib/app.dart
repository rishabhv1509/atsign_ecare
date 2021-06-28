import 'package:atsign_ecare/routes/routes.dart';
import 'package:atsign_ecare/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return MaterialApp(
      title: 'AtSign Ecare',
      debugShowCheckedModeBanner: false,
      initialRoute: SetupRoutes.initialRoute,
      navigatorKey: NavService.navKey,
      // home: Home(),
      theme: ThemeData(
          fontFamily: 'HelveticaNeu',
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
              color: Colors.white,
              elevation: 0,
              iconTheme: IconThemeData(color: Colors.black),
              brightness: Brightness.light),
          buttonBarTheme: ButtonBarThemeData(
            alignment: MainAxisAlignment.center,
          )),
      routes: SetupRoutes.routes,
    );
  }
}
