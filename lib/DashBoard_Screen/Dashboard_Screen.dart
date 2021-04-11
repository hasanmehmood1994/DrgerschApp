import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Dashboard_Screen extends StatefulWidget {
  @override
  _Dashboard_ScreenState createState() => _Dashboard_ScreenState();
}

class _Dashboard_ScreenState extends State<Dashboard_Screen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
body: Column(
  children:   [Expanded(
    child: WebView(
      onWebResourceError: (onerror){print("${onerror}");},
      onPageFinished: (ff){print("done");},
      onWebViewCreated: (cc){print("created");},
      onPageStarted: (ss){print("started");},
    debuggingEnabled: true,
    javascriptMode: JavascriptMode.disabled,

            initialUrl: 'https://www.drgersch.de/english-speaking-functional-medicine-doctor-in-ktown.html#imprint',
          ),
  ),Container(

  )],
),
      ),
    );
  }
}
