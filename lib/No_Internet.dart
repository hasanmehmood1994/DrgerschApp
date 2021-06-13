import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart';
import 'package:toast/toast.dart';

import 'DashBoard_Screen/Dashboard_Screen.dart';
import 'DashBoard_Screen/Dashboard_Screen_German.dart';
import 'Sharef_Pref.dart';
import 'Sharef_Pref.dart';

class No_Internet extends StatefulWidget {
  @override
  _No_InternetState createState() => _No_InternetState();
}

class _No_InternetState extends State<No_Internet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [

          Icon(Icons.wifi_off_outlined,color: Colors.black,size: 150,),
        Container(
          padding: EdgeInsets.all(20),
          child: Text(
            'No internet access. For security reasons, this app stores no data on your phone, therefore, internet access is always required to use it',
            style: TextStyle(
              fontSize: 25,
            ),
            textAlign:
            TextAlign.center,
          ),
        ),

          SizedBox(
            height: 10,
          ),
          Align(
            child: SizedBox(
              width: 220.0,
              child: RaisedButton(
                shape: StadiumBorder(),
                onPressed: () {
                  CheckConnection();
                },
                child: Text("Retry"),
                color: Color(0xffCDDFB9),
              ),
            ),
          )
        ],


      ),
    );
  }

  CheckConnection() async {
    try {
      final result = await InternetAddress.lookup('www.google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
        After_Splash_Screen();
      }
    } on SocketException catch (_) {
      Toast.show("No Internet Connection Available", context);
    }
  }

  After_Splash_Screen() async {

    SharedPref sharedPref = SharedPref();
    bool status = await sharedPref.getLoginStatus()??false;


    if(status== false) {
      String sp = await sharedPref.getLanguage()??"english";
      return new Future.delayed(const Duration(seconds: 2), () {
        if( sp.contains('english')) {
          Navigator.of(context).pushReplacementNamed('/login');
        }else {
          Navigator.of(context).pushReplacementNamed('/loginGerman');
        }
      });
    }else {

      String sp = await sharedPref.getLanguage()??"english";
      String ptno = await sharedPref.getPatientNo();
      String pass = await sharedPref.getPass();
      String sessionid = await sharedPref.getSessionId();
      String duration = await sharedPref.getSessionDuration();
      return new Future.delayed(const Duration(seconds: 2), () {
        if( sp.contains('english')) {
          Navigator.of(context).push(PageTransition(
              duration: const Duration(milliseconds: 1000),
              type: PageTransitionType.transferUp,
              child: Dashboard_Screen(ptno, pass, sessionid, duration) ));
        }else {
          Navigator.of(context).push(PageTransition(
              duration: const Duration(milliseconds: 1000),
              type: PageTransitionType.transferUp,
              child: Dashboard_Screen_German(ptno, pass, sessionid, duration) ));           }
      });
    }




  }

}
