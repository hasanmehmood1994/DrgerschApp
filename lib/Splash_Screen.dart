import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:drgerschapp/Sharef_Pref.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class Splash_Screen extends StatefulWidget {
  @override
  _Splash_ScreenState createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  SharedPref sharedPref=SharedPref();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    After_Splash_Screen();
  //  callapi();
    //getHttp();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: CircularProgressIndicator(),

        ),
      ),
    );
  }
   After_Splash_Screen()async {
     String sp = await sharedPref.getLanguage()??"english";
    return new Future.delayed(const Duration(seconds: 2), () {
      if( sp.contains('english')) {
        Navigator.of(context).pushReplacementNamed('/login');
      }else {
        Navigator.of(context).pushReplacementNamed('/loginGerman');
      }
    });
  }
  callapi()async{
    var url = 'https://www.ehausbesuch.de/app.cgi?action=app&userid=934298&passwort=123456789&version=1.0';
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body.isEmpty}');
    print('Response body: ${response.body.contains("session_id")}');
    print('Response body: ${response.body.contains("session_duration")}');
    print('Response body: ${response.body.contains("language")}');
    print('Response body: ${response.body.contains("change_password")}');

  }

  void getHttp() async {
    try {
      Response response = await Dio().get(
          "https://www.ehausbesuch.de/app.cgi?action=app&userid=934298&passwort=123456789&version=1.0");

      String jsonsDataString = response.toString();
      final jsonData = jsonDecode(jsonsDataString);

//then you can get your values from the map
      if(jsonData["session_id"] != null){
         print("${jsonData["session_id"]}");
    }
    } catch (e) {
      print(e);
    }
  }
}
