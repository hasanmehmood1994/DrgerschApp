import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Splash_Screen extends StatefulWidget {
  @override
  _Splash_ScreenState createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    After_Splash_Screen();
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
  Future After_Splash_Screen()async {
    return new Future.delayed(const Duration(seconds:1), () {
//it will remove last class from stack
      Navigator.of(context).pushReplacementNamed('/login');
    });
  }
}
