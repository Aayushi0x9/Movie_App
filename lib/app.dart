import 'package:flutter/material.dart';
import 'package:movie_app/utils/app_routes_utils.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
      ),
      initialRoute: AppRoutes.homePage,
      routes: AppRoutes.routes,
    );
  }
}
