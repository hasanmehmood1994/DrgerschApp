import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
