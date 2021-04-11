

import 'package:shared_preferences/shared_preferences.dart';

class SharedPref{

  setPatientNo(String patientno) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('patientno', patientno);
  }

  getPatientNo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String patientno = prefs.getString('patientno');
    return patientno;
  }

  setPass(String pass) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('password', pass);
  }

  getPass() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String pass = prefs.getString('password');
    return pass;
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

  setSessionId(String session) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('session_id', session);
  }

  getSessionId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String session_id = prefs.getString('session_id');
    return session_id;
  }

  setSessionDuration(String session) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('session_duration', session);
  }

  getSessionDuration() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String session_duration = prefs.getString('session_duration');
    return session_duration;
  }

}