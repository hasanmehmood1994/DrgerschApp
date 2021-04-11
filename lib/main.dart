import 'package:drgerschapp/Signin_Screen/Login_Page.dart';
import 'package:drgerschapp/Signin_Screen/Login_Page_German.dart';
import 'package:drgerschapp/Splash_Screen.dart';
import 'package:flutter/material.dart';

import 'DashBoard_Screen/Dashboard_Screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes:{
        '/': (context) => Splash_Screen(),
        '/login': (context) => LoginPage(),
        '/loginGerman': (context) => LoginPageGerman(),
        '/dashboard': (context) => Dashboard_Screen(),

//  I love You
      },
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        accentColor: Color(0xffCDDFB9),

      ),

    );
  }
}


