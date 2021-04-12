import 'package:drgerschapp/Sharef_Pref.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Dashboard_Screen extends StatefulWidget {

  @override


  _Dashboard_ScreenState createState() => _Dashboard_ScreenState();
}
SharedPref sharedPref=SharedPref();
String session_id;
String pass;
String p_no;
String duration;
WebViewController _controller;
class _Dashboard_ScreenState extends State<Dashboard_Screen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pass="123456789";
   p_no="934298";
getData();
  //"https://www.ehausbesuch.de/index.cgi?app=welcome&userid="+p_no+"&passwort="+pass;
  ///  https://www.drgersch.de/english-speaking-functional-medicine-doctor-in-ktown.html#imprint
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(
 floatingActionButton: FloatingActionButton(child: Icon(Icons.logout),onPressed: (){sharedPref.setLoginStatus(false);},),
body: Column(
  children:   [
    Expanded(
    child: WebView(

      onWebResourceError: (onerror){print("${onerror}");},
      onPageFinished: (ff){print("done");},
      onWebViewCreated: (WebViewController webViewController) {
        _controller = webViewController;
      },
      onPageStarted: (ss){print("started");},
    debuggingEnabled: true,
    javascriptMode: JavascriptMode.disabled,

          ),
  ),

    Container(

  )],
),
      ),
    );
  }
}

 getData() async{
  duration=await sharedPref.getSessionDuration();
  session_id=await sharedPref.getSessionId();
  pass=await sharedPref.getPass();
  p_no=await sharedPref.getPatientNo();
  print(""+duration+"" +session_id+""+pass+p_no);
 _controller.loadUrl("https://www.ehausbesuch.de/index.cgi?app=welcome&userid=${p_no}&passwort=${pass}").catchError((onError){print("$onError");});
}
