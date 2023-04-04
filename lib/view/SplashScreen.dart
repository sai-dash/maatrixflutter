import 'dart:async';
import 'package:lottie/lottie.dart';

import 'package:flutter/material.dart';
import 'package:maatrixflutter/view/AboutScreen.dart';
import 'package:maatrixflutter/view/CalculatorPage.dart';
import 'package:maatrixflutter/view/ExamScreen.dart';
import 'package:maatrixflutter/view/HomeScreen.dart';
import 'package:maatrixflutter/view/LoginScreen.dart';
import 'package:maatrixflutter/view/MyWebView.dart';
import 'package:maatrixflutter/view/UserListScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>const ExamPage()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.yellow,
        child:Lottie.asset('assets/lottie/car.json')
    );
  }
}
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(

      body: Center(
          child:Text("Welcome to Home Page",
              style: TextStyle( color: Colors.black, fontSize: 30)
          )
      ),
    );
  }
}
