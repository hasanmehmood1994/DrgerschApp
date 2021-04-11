

import 'package:shared_preferences/shared_preferences.dart';

class SharedPref{

  setLoginDetails(int patientno,String pass) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('patientno', patientno);
    prefs.setString('password', pass);
  }
  getLoginDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int patientno = prefs.getInt('patientno');
    String pass = prefs.getString('pass');
  }
  setLoginStatus(bool status) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('loginstatus', status);
  }
  getLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool loginstatus = prefs.getBool('loginstatus')??false;
    return loginstatus;

  }

  setLanguage(String language) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('Language', language);
  }

  getLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String language = prefs.getString('Language')??'english';
    return language;

  }
}