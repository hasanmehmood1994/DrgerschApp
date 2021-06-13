import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart';
import 'package:toast/toast.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../DashBoard_Screen/Dashboard_Screen.dart';
import '../DashBoard_Screen/Dashboard_Screen_German.dart';
import '../Sharef_Pref.dart';

class Imprint_Class extends StatefulWidget {
  String which;
  Imprint_Class(this.which);
  @override
  _Imprint_ClassState createState() => _Imprint_ClassState(this.which);
}

class _Imprint_ClassState extends State<Imprint_Class> {

  String webviewurl;
  _Imprint_ClassState(String which);
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.which.contains("en"))
      {
  webviewurl="https://www.drgersch.de/english-speaking-functional-medicine-doctor-in-ktown.html#imprint";
      }
    else{
      webviewurl="https://www.drgersch.de/#impressum";
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
              child: WebView(
                onWebResourceError: (onerror){ErrorDialog();},
                onPageFinished: (ff){print("done");},
                onWebViewCreated: (cc){print("created");},
                onPageStarted: (ss){print("started");},
                debuggingEnabled: true,
                javascriptMode: JavascriptMode.disabled,
                initialUrl: webviewurl,
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
}
