import 'package:flutter/cupertino.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
                onWebResourceError: (onerror){print("${onerror}");},
                onPageFinished: (ff){print("done");},
                onWebViewCreated: (cc){print("created");},
                onPageStarted: (ss){print("started");},
                debuggingEnabled: true,
                javascriptMode: JavascriptMode.disabled,
                initialUrl: webviewurl,
              ),
    );
  }
}
