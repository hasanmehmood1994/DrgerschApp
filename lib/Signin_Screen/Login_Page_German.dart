import 'dart:io';

import 'package:drgerschapp/Language.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:http/http.dart' as http;
import '../Sharef_Pref.dart';

class LoginPageGerman extends StatefulWidget {
  @override
  _LoginPageGermanState createState() => _LoginPageGermanState();
}

class _LoginPageGermanState extends State<LoginPageGerman> {
  bool circulervisibly = false;
  bool loginbtnvisibly = true;
  TextEditingController email_controler = TextEditingController();
  TextEditingController pass_controler = TextEditingController();
  final GlobalKey<FormFieldState> _emailFormKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _passFormKey = GlobalKey<FormFieldState>();
  bool validate = false;
  bool loginstatus = false;

  bool absscurestatus=true;
  bool valuefirst= false;
  IconData passicon=Icons.remove_red_eye;

  int selectedRadioTile;

  int currentPage = 0;
  SharedPref sharedPref=SharedPref();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    email_controler.text = "";
    pass_controler.text = "";

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: true,
          body:  Column(
            children: [
              Expanded(

                child: Container(
                  child: Container(
                    //     margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height/10, 0, 0),
                    child: ListView(

                      children: <Widget>[
                        Container(

                          child: Align(
                              alignment: Alignment.center,
                              child: Image.asset('assets/logo.png',width: 200,height: 200,)
                          ),
                        ),

                        Container(

                          child: Align(
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                Text('Dr. med. Christian Gersch',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10)),
                                Text('Privatärztliche Praxis',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10
                                )),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(30.0),
                          child: Column(
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(color: Colors.grey[100]))),

                                    child: Row(
                                      children: [

                                        Expanded(
                                          child: TextField(
                                            controller:  email_controler,
                                            decoration: InputDecoration(
                                              prefixIcon:Icon(Icons.email),
                                              border: OutlineInputBorder(),
                                              labelText: 'Patienten nummer',

                                              labelStyle: TextStyle(
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    width: 2.0),
                                                borderRadius: BorderRadius.circular(25.0),
                                              ),

                                            ),
                                          ),

                                        ),
                                      ],
                                    ),


                                  ),

                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(color: Colors.grey[100]))),

                                    child: Row(
                                      children: [

                                        Expanded(
                                          child: TextField(
                                            obscureText: absscurestatus,
                                            controller:  pass_controler,
                                            decoration: InputDecoration(
                                              prefixIcon:Icon(Icons.lock),
                                              suffixIcon:InkWell(child: Icon(passicon),onTap: (){
                                                if(absscurestatus)
                                                {
                                                  setState(() {
                                                    absscurestatus=false;

                                                    passicon=Icons.visibility_off;
                                                  });
                                                }
                                                else{
                                                  setState(() {
                                                    absscurestatus=true;
                                                    passicon=Icons.remove_red_eye;

                                                  });
                                                }
                                              },),
                                              border: OutlineInputBorder(),
                                              labelText: 'Passwort',
                                              labelStyle: TextStyle(
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    width: 2.0),
                                                borderRadius: BorderRadius.circular(25.0),
                                              ),

                                            ),
                                          ),

                                        ),

                                      ],
                                    ),


                                  ),
                                  Row(
                                    children: [
                                      Checkbox(
                                        checkColor: Colors.black,
                                        activeColor: Color(
                                            0xffb6de88),
                                        value: this.valuefirst,
                                        onChanged: (bool value) {
                                          setState(() {
                                            loginstatus  = value;
                                            this.valuefirst = value;
                                          });
                                        },
                                      ),
                                      Text('Passwort speichern')
                                    ],
                                  ),
                                ],
                              ),

                              Visibility(
                                visible: loginbtnvisibly,
                                child: Container(
                                  padding: EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(color: Colors.grey[100]))),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                    children: [
                                      Expanded(
                                        child: RaisedButton(
                                          shape: StadiumBorder(),
                                          onPressed: () {
                                            if(email_controler.text.trim().toString().isEmpty){
                                              Toast.show('Please Enter Patient Number',context);
                                            }else if(pass_controler.text.trim().toString().isEmpty){
                                              Toast.show('Please Enter Password',context);
                                            }else{
                                              CheckConnection(email_controler.text.trim().toString(),pass_controler.text.trim().toString(),loginstatus);
                                            }
                                          },
                                          child: Text("Einloggen"),
                                          color: Color(0xffCDDFB9),
                                        ),
                                      ),


                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                          child: RaisedButton(
                                            shape: StadiumBorder(),
                                            onPressed: () {
                                              showDialog(
                                                  context: context,
                                                  builder: (BuildContext context) {
                                                    return Dialog(
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                          BorderRadius.circular(20.0)), //this right here
                                                      child: Container(
                                                        height: 350,
                                                        child: Padding(
                                                          padding: const EdgeInsets.all(12.0),
                                                          child: Column(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [

                                                              Align(
                                                                  child: Image.asset('assets/logo.png',height: 100,width: 100,)
                                                              ),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              Text('Sie können sich nicht alleine registrieren. Bitte vereinbaren Sie einen Termin mit der Praxis, um Anmeldedaten zu erhalten.',style: TextStyle(fontSize: 16,),textAlign: TextAlign.center,),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              Align(
                                                                child: SizedBox(
                                                                  width: 220.0,
                                                                  child:RaisedButton(
                                                                    shape: StadiumBorder(),
                                                                    onPressed: () {
                                                                      Navigator.pop(context);

                                                                    },
                                                                    child: Text("OK"),
                                                                    color: Color(0xffCDDFB9),
                                                                  ),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                              );
                                            },
                                            child: Text("Registrieren"),
                                            color: Color(0xffCDDFB9),
                                          ))
                                    ],
                                  ),
                                ),
                              ),

                              Visibility(
                                  visible: circulervisibly,
                                  child: CircularProgressIndicator()),
                              SizedBox(
                                height: 20,
                              ),
                              InkWell(
                                child: Text('Passwort vergessen?',
                                    style: TextStyle(
                                        fontSize: 14, fontWeight: FontWeight.w500,color: Color(
                                        0xffb6de88), decoration: TextDecoration.underline)),
                                onTap: (){

                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Dialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(20.0)), //this right here
                                          child: Container(

                                            child: Padding(
                                              padding: const EdgeInsets.all(12.0),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [

                                                  Align(
                                                      child: Image.asset('assets/logo.png',height: 100,width: 100,)
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Align(child: Column(
                                                    children: [
                                                      Text('Kontaktieren Sie bitte',style: TextStyle(fontSize: 16,),textAlign: TextAlign.center,),
                                                      Text('office@drgersch.de',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                                                      Text('um neue Anmeldedaten anzufordern.',style: TextStyle(fontSize: 16,),textAlign: TextAlign.center,),

                                                    ],
                                                  )),

                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Align(
                                                    child: SizedBox(
                                                      width: 220.0,
                                                      child:RaisedButton(
                                                        shape: StadiumBorder(),
                                                        onPressed: () {
                                                          Navigator.pop(context);

                                                        },
                                                        child: Text("OK"),
                                                        color: Color(0xffCDDFB9),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                  );

                                },
                              ),

                              //   FadeAnimation(1.5, Text("Forgot Password?", style: TextStyle(color:Color.fromRGBO(0, 137, 172, 1)),)),
                            ],
                          ),
                        ),


                      ],
                    ),
                  ),
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: InkWell(

                          child: Column(
                            children: [
                              Container(

                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black,
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                ),
                                child: Padding(
                                    padding: EdgeInsets.only(bottom: 3.0,top: 3.0,left: 15,right: 15),
                                    child: Image.asset('assets/imprint.jpg',height: 30,width: 30,)),

                              ),
                              Text('Impressum',style: TextStyle(color: Colors.black,fontSize: 10,fontWeight: FontWeight.bold),)
                            ],
                          ),
                        )),

                    Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: (){
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return StatefulBuilder(
                                      builder: (context, setState) {
                                        return Dialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(
                                                  20.0)),
                                          //this right here
                                          child: Container(
                                            height: 200,

                                            child: Padding(
                                              padding:
                                              const EdgeInsets.all(12.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  RadioListTile(
                                                    value: 1,
                                                    groupValue:
                                                    selectedRadioTile,
                                                    title: Text("English"),
                                                    onChanged: (val) {
                                                      if (sharedPref.getLanguage() != 'english') {
                                                        sharedPref.setLanguage('english');
                                                        Navigator.pop(context);
                                                        Navigator.of(context).pushReplacementNamed('/login');
                                                      }
                                                      print(
                                                          "Radio Tile pressed $val");
                                                      setState(() {
                                                        selectedRadioTile =
                                                            val;
                                                      });
                                                    },
                                                    activeColor:
                                                    Color(0xffCDDFB9),
                                                    selected: false,
                                                  ),
                                                  RadioListTile(
                                                    value: 2,
                                                    groupValue:
                                                    selectedRadioTile,
                                                    title: Text("German"),
                                                    onChanged: (val) {
                                                      if (sharedPref
                                                          .getLanguage() !=
                                                          'german') {
                                                        sharedPref
                                                            .setLanguage(
                                                            'german');
                                                        Navigator.pop(
                                                            context);
                                                        Navigator.of(context).pushReplacementNamed('/loginGerman');

                                                      }
                                                      print(
                                                          "Radio Tile pressed $val");

                                                      setState(() {
                                                        selectedRadioTile =
                                                            val;
                                                      });
                                                    },
                                                    activeColor:
                                                    Color(0xffCDDFB9),
                                                    selected: false,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      });
                                });
                          },

                          child: Column(
                            children: [
                              Container(

                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black,
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                ),
                                child: Padding(
                                    padding: EdgeInsets.only(bottom: 3.0,top: 3.0,left: 15,right: 15),
                                    child: Image.asset('assets/clanguage.jpg',height: 30,width: 30,)),

                              ),
                              Text('Sprache ändern',style: TextStyle(color: Colors.black,fontSize: 10,fontWeight: FontWeight.bold),)
                            ],
                          ),
                        )),


                    Expanded(
                        flex: 1,
                        child: InkWell(

                          child: Column(
                            children: [
                              Container(

                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black,
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                ),
                                child: Padding(
                                    padding: EdgeInsets.only(bottom: 3.0,top: 3.0,left: 15,right: 15),
                                    child: Image.asset('assets/appointment.png',height: 30,width: 30,)),

                              ),
                              Text('Termine',style: TextStyle(color: Colors.black,fontSize: 10,fontWeight: FontWeight.bold),)
                            ],
                          ),
                        )),


                    Expanded(
                        flex: 1,
                        child: InkWell(

                          child: Column(
                            children: [
                              Container(

                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black,
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                ),
                                child: Padding(
                                    padding: EdgeInsets.only(bottom: 3.0,top: 3.0,left: 15,right: 15),
                                    child: Image.asset('assets/settings.png',height: 30,width: 30,)),

                              ),
                              Text('Privatsphäre',style: TextStyle(color: Colors.black,fontSize: 10,fontWeight: FontWeight.bold),)
                            ],
                          ),
                        )),


                  ],
                ),
              ),

            ],
          )
      ),
    );
  }

  Login_User_Api(String ptno,String pass,bool status)async{
    var url = 'https://www.ehausbesuch.de/app.cgi?action=app&userid='+ptno+'&passwort='+pass+'&version=1.0';
    var response = await http.get(url);


    print('Response status: ${response.statusCode}');


    if(response.body.contains("session_id"))
    {
      print(response.body.substring(11,50));
      print(response.body.substring(68,70));
      sharedPref.setPatientNo(ptno);
      sharedPref.setPass(pass);
      sharedPref.setSessionId(""+response.body.substring(11,50));
      sharedPref.setSessionDuration(""+getDuration(response.body.substring(68,70).toString()));
      sharedPref.setLoginStatus(status);
      sharedPref.setLanguage("english");
      Toast.show("Login", context);
      Navigator.of(context).pushReplacementNamed('/dashboard');
    }else{
      Toast.show("Invalid user ", context);
    }

  }

  getDuration(String session_duration)
  {
    if (session_duration.contains("1;")){
      session_duration = "1";
    }if (session_duration.contains("2")){
      session_duration = "2";
    }if (session_duration.contains("3")){
      session_duration = "3";
    }if (session_duration.contains("4")){
      session_duration = "4";
    }if (session_duration.contains("5")){
      session_duration = "5";
    }if (session_duration.contains("6")){
      session_duration = "6";
    }if (session_duration.contains("7")){
      session_duration = "7";
    }if (session_duration.contains("8")){
      session_duration = "8";
    }if (session_duration.contains("9")){
      session_duration = "9";
    }if (session_duration.contains("10")){
      session_duration = "10";
    }if (session_duration.contains("11")){
      session_duration = "11";
    }if (session_duration.contains("12")){
      session_duration = "12";
    }if (session_duration.contains("13")){
      session_duration = "13";
    }if (session_duration.contains("14")){
      session_duration = "14";
    }if (session_duration.contains("15")){
      session_duration = "15";
    }if (session_duration.contains("16")){
      session_duration = "16";
    }if (session_duration.contains("17")){
      session_duration = "17";
    }if (session_duration.contains("18")){
      session_duration = "18";
    }if (session_duration.contains("19")){
      session_duration = "19";
    }if (session_duration.contains("20")){
      session_duration = "20";
    }
    return session_duration;
  }

  CheckConnection(email,pass,loginstatus) async {
    try {
      final result = await InternetAddress.lookup('www.google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        Login_User_Api(email,pass,loginstatus);
      }
    } on SocketException catch (_) {
      Toast.show("Keine Internetverbindung verfügbar", context);
    }
  }

}
