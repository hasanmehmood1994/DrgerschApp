import 'package:drgerschapp/Sharef_Pref.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Dashboard_Screen extends StatefulWidget {
  String ptno;
  String pass;
  String sessionid;
  String duration;

  Dashboard_Screen(this.ptno, this.pass, this.sessionid, this.duration);

  @override
  _Dashboard_ScreenState createState() => _Dashboard_ScreenState(
      this.ptno, this.pass, this.sessionid, this.duration);
}

class _Dashboard_ScreenState extends State<Dashboard_Screen> {
  SharedPref sharedPref = SharedPref();
  String ptno;
  String pass;
  String sessionid;
  String duration;
  WebViewController controller;

  _Dashboard_ScreenState(this.ptno, this.pass, this.sessionid, this.duration);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // pass="123456789";
    // ptno="934298";
    pass = widget.pass;
    ptno = widget.ptno;
//getData();
    //"https://www.ehausbesuch.de/index.cgi?app=welcome&userid="+p_no+"&passwort="+pass;
    ///  https://www.drgersch.de/english-speaking-functional-medicine-doctor-in-ktown.html#imprint
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // floatingActionButton: FloatingActionButton(
        //   child: Icon(Icons.logout),
        //   onPressed: () {
        //     getData();
        //     sharedPref.setLoginStatus(false);
        //   },
        // ),
        body: Column(
          children: [
            Expanded(
              child: WebView(
                onWebResourceError: (onerror) {
                  print("${onerror}");
                },
                onPageFinished: (ff) {
                  print("done");
                },
                onWebViewCreated: (WebViewController webViewController) {
                  controller = webViewController;
                },
                onPageStarted: (ss) {
                  print("started");
                },
                debuggingEnabled: true,
                javascriptMode: JavascriptMode.unrestricted,
                initialUrl: 'https://www.ehausbesuch.de/index.cgi?app=welcome&userid=${widget.ptno}&passwort=${widget.pass}',
              ),
            ),
            Container(
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {On_Click_message();},
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
                        onTap: () {On_Click_Me();},
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
                        onTap: () {On_Click_Appointment();},
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
                          _showPopupMenu(details.globalPosition);
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

  _showPopupMenu(Offset offset) async {
    double left = offset.dx;
    double top = offset.dy;
    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(left, top, 0, 0),
      items: [
        PopupMenuItem<String>(
            child: const Text(
              'Enable Push Notifications',
              style: TextStyle(fontSize: 12),
            ),
            value: '1'),
        PopupMenuItem<String>(
            child: const Text(
              'Enable Email Notifications',
              style: TextStyle(fontSize: 12),
            ),
            value: '2'),
        PopupMenuItem<String>(
            child: const Text(
              'Change Password',
              style: TextStyle(fontSize: 12),
            ),
            value: '3'),
        PopupMenuItem<String>(
            child: const Text(
              'Logout',
              style: TextStyle(fontSize: 12),
            ),
            value: '4'),
      ],
      elevation: 10.0,
    ).then((value) {
      if (value != null) print(value);
    });
  }

  getData() async {
    duration = await sharedPref.getSessionDuration();
    sessionid = await sharedPref.getSessionId();
    pass = await sharedPref.getPass();
    ptno = await sharedPref.getPatientNo();
    print("" + duration + "" + sessionid + "" + pass + ptno);
    controller.loadUrl(
        "https://www.ehausbesuch.de/index.cgi?app=nachrichten&userid=" +
            ptno +
            "&passwort=" +
            pass);
    controller.loadUrl(
        "https://www.ehausbesuch.de/index.cgi?app=diagnosen&userid=" +
            ptno +
            "&passwort=" +
            pass);
    //controller.loadUrl("https://www.ehausbesuch.de/index.cgi?app=welcome&userid=${ptno}&passwort=${pass}").catchError((onError){print("$onError");});
  }

  void On_Click_message() {controller.loadUrl("https://www.ehausbesuch.de/index.cgi?app=nachrichten&userid=" + widget.ptno + "&passwort=" + widget.pass);}

  void On_Click_Me() {   controller.loadUrl("https://www.ehausbesuch.de/index.cgi?app=diagnosen&userid=" +widget.ptno  + "&passwort=" + widget.pass);}

  void On_Click_Appointment() {
    controller.loadUrl("https://www.ehausbesuch.de/termine.cgi?app=buchen&userid=" +widget.ptno+ "&passwort=" + widget.pass);}
}
