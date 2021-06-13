import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart';
import 'package:toast/toast.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../DashBoard_Screen/Dashboard_Screen.dart';
import '../DashBoard_Screen/Dashboard_Screen_German.dart';
import '../Sharef_Pref.dart';

class Appointment_en extends StatefulWidget {
  @override
  _Appointment_enState createState() => _Appointment_enState();
}

class _Appointment_enState extends State<Appointment_en> {
  WebViewController controller;
  bool loader_visibly=true;
  @override
  Widget build(BuildContext context) {
    child: SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Visibility(
              visible: loader_visibly,
              child: Align(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator()),
            ),
            Expanded(
              child:
              WebView(
                onWebResourceError: (onerror) {
                  print("${onerror}");
                  Toast.show("Some thing went wrong", context);
                    ErrorDialog();
                  print("done");setState(() {
                    loader_visibly=false;
                  });
                  // Navigator.pop(context);
                },
                onPageFinished: (ff) {
                  print("done");setState(() {
                    loader_visibly=false;
                  });
                  // Navigator.pop(context);
                },
                onWebViewCreated: (WebViewController webViewController) {
                  controller = webViewController;
                },
                onPageStarted: (ss) {
                  print("started");
                },
                debuggingEnabled: true,
                javascriptMode: JavascriptMode.unrestricted,
                initialUrl: 'https://www.ehausbesuch.de/termine.cgi?english=buchen&userid=0&passwort=unbekannt&praxis=15',

              ),
            ),
            Container(
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {Login_First_Dialog();},
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                  ),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                              child: Padding(
                                  padding: EdgeInsets.only(
                                      bottom: 3.0,
                                      top: 3.0,
                                      left: 15,
                                      right: 15),
                                  child: Image.asset(
                                    'assets/messaging.png',
                                    height: 30,
                                    width: 30,
                                  )),
                            ),
                            Text(
                              'Messaging',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {Login_First_Dialog();},
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                  ),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                              child: Padding(
                                  padding: EdgeInsets.only(
                                      bottom: 3.0,
                                      top: 3.0,
                                      left: 15,
                                      right: 15),
                                  child: Image.asset(
                                    'assets/me.png',
                                    height: 30,
                                    width: 30,
                                  )),
                            ),
                            Text(
                              'Me',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {Login_First_Dialog();},
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                  ),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                              child: Padding(
                                  padding: EdgeInsets.only(
                                      bottom: 3.0,
                                      top: 3.0,
                                      left: 15,
                                      right: 15),
                                  child: Image.asset(
                                    'assets/appointment.png',
                                    height: 30,
                                    width: 30,
                                  )),
                            ),
                            Text(
                              'Appointment',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTapDown: (TapDownDetails details) {
                          Login_First_Dialog();
                        },
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                  ),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                              child: Padding(
                                  padding: EdgeInsets.only(
                                      bottom: 3.0,
                                      top: 3.0,
                                      left: 15,
                                      right: 15),
                                  child: Image.asset(
                                    'assets/settings.png',
                                    height: 30,
                                    width: 30,
                                  )),
                            ),
                            Text(
                              'Settings',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  ErrorDialog(){
    return   showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return Dialog(

            shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(20.0)),
            //this right here
            child: Container(
              height: 300,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment:
                  MainAxisAlignment.center,
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Align(
                        child: Image.asset(
                          'assets/logo.png',
                          height: 100,
                          width: 100,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                        child: Text(
                          'Something went wrong. please try later',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                          textAlign:
                          TextAlign.center,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      child: SizedBox(
                        width: 220.0,
                        child: RaisedButton(
                          shape: StadiumBorder(),
                          onPressed: () async {
                            try {
                              Navigator.pop(context);
                              final result = await InternetAddress.lookup('www.google.com');
                              if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
                                After_Splash_Screen();
                              }
                            } on SocketException catch (_) {
                              Toast.show("No Internet Connection", context);
                            }

                          },
                          child: Text("RE-LOGIN"),
                          color: Color(0xffCDDFB9),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
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

  void Login_First_Dialog
      () {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(20.0)),
            //this right here
            child: Container(
              height: 300,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment:
                  MainAxisAlignment.center,
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Align(
                        child: Image.asset(
                          'assets/logo.png',
                          height: 100,
                          width: 100,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                        child: Column(
                          children: [
                            Text(
                              'Please Login First',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                              textAlign:
                              TextAlign.center,
                            ),


                          ],
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      child: SizedBox(
                        width: 220.0,
                        child: RaisedButton(
                          shape: StadiumBorder(),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: InkWell(
                              onTap: (){
                                Navigator.pop(context);
                              },

                              child: Text("Login")),
                          color: Color(0xffCDDFB9),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

}
