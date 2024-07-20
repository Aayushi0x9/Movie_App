import 'package:flutter/material.dart';
import 'package:movie_app/views/DetailPage/detail_page.dart';
import 'package:movie_app/views/FavoutitePage/favourite_page.dart';
import 'package:movie_app/views/HomePage/homepage.dart';

class AppRoutes {
  // static String splashScreen = '/';
  // static String loginPage = 'loginPage';
  static String homePage = 'homePage';
  static String detailPage = 'setWallpaper';
  static String favouritePage = 'likedpage';

  static Map<String, WidgetBuilder> routes = {
    // AppRoutes.splashScreen: (context) => SplashScreen(),
    // AppRoutes.loginPage: (context) => LoginScreen(),
    AppRoutes.homePage: (context) => HomePage(),
    AppRoutes.detailPage: (context) => DetailPage(),
    AppRoutes.favouritePage: (context) => FavouritePage(),
  };

  AppRoutes._();
  static final AppRoutes appRoutes = AppRoutes._();
}
