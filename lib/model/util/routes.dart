import 'package:flutter/material.dart';
import 'package:maatrixflutter/view/AboutScreen.dart';
import 'package:maatrixflutter/view/SplashScreen.dart';

import '../../view/UserListScreen.dart';


class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    return MaterialPageRoute(
        builder: (BuildContext context) => const SplashScreen());
  }
}
