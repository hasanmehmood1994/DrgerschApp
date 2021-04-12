import 'package:drgerschapp/Sharef_Pref.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Dashboard_Screen extends StatefulWidget {
  String ptno; String pass; String sessionid; String duration;
  Dashboard_Screen(this.ptno,this.pass, this.sessionid,this.duration);


  @override


  _Dashboard_ScreenState createState() => _Dashboard_ScreenState(this.ptno,this.pass, this.sessionid,this.duration);
}



class _Dashboard_ScreenState extends State<Dashboard_Screen> {
  SharedPref sharedPref=SharedPref();
  String ptno; String pass; String sessionid; String duration;
  WebViewController controller;
  _Dashboard_ScreenState(this.ptno, this.pass, this.sessionid, this.duration);


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

   // pass="123456789";
  // ptno="934298";
//getData();
  //"https://www.ehausbesuch.de/index.cgi?app=welcome&userid="+p_no+"&passwort="+pass;
  ///  https://www.drgersch.de/english-speaking-functional-medicine-doctor-in-ktown.html#imprint
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(
 floatingActionButton: FloatingActionButton(child: Icon(Icons.logout),onPressed: (){
   getData();

   sharedPref.setLoginStatus(false);},),
body: Column(
  children:   [
    Expanded(
    child: WebView(
      onWebResourceError: (onerror){print("${onerror}");},
      onPageFinished: (ff){print("done");},
      onWebViewCreated: (WebViewController webViewController) {
        controller = webViewController;
      },
      onPageStarted: (ss){print("started");},
    debuggingEnabled: true,
      javascriptMode: JavascriptMode.unrestricted,
      initialUrl: 'https://www.ehausbesuch.de/index.cgi?app=welcome&userid=${widget.ptno}&passwort=${widget.pass}',

          ),
  ),

    Container(

  )],
),
      ),
    );
  }
  getData() async{
    duration=await sharedPref.getSessionDuration();
    sessionid=await sharedPref.getSessionId();
    pass=await sharedPref.getPass();
    ptno=await sharedPref.getPatientNo();
    print(""+duration+"" +sessionid+""+pass+ptno);
    controller.loadUrl("https://www.ehausbesuch.de/index.cgi?app=nachrichten&userid=" + ptno + "&passwort=" +pass);
    controller.loadUrl("https://www.ehausbesuch.de/index.cgi?app=diagnosen&userid=" + ptno + "&passwort=" + pass);
    //controller.loadUrl("https://www.ehausbesuch.de/index.cgi?app=welcome&userid=${ptno}&passwort=${pass}").catchError((onError){print("$onError");});
  }
}


