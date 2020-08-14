import 'package:boilerplate/ui/detail_page/detail_page.dart';
import 'package:boilerplate/ui/home/main_home.dart';
import 'package:flutter/material.dart';

import 'ui/home/home.dart';
import 'ui/login/login.dart';
import 'ui/splash/splash.dart';

class Routes {
  Routes._();

  //static variables
  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/home';
  static const String mainHome = '/mainHome';
  static const String details = '/details';

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => SplashScreen(),
    login: (BuildContext context) => LoginScreen(),
    home: (BuildContext context) => HomeScreen(),
    mainHome: (BuildContext context) => MainHome(),
    details: (BuildContext context) => DetailPage(),
  };
}



