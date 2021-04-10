import 'package:drgerschapp/Language.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  bool absscurestatus=true;
  bool valuefirst= false;
  IconData passicon=Icons.remove_red_eye;

  int currentPage = 0;

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
                flex: 9,
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
                                Text('Private Practice at Kaiserslautern/Germany',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10
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
                                              labelText: 'Email',

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
                                              labelText: 'Password',
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
                                            this.valuefirst = value;
                                          });
                                        },
                                      ),
                                      Text('Save Password')
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
                                          onPressed: () {},
                                          child: Text("Login"),
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
                                                        height: 300,
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
                                                              Text('You cannot register on your own. Please schedule an appointment with the practice to receive login data.',style: TextStyle(fontSize: 16,),textAlign: TextAlign.center,),
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
                                            child: Text("Register"),
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
                                child: Text('Forgot Password?',
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
                                            height: 300,
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
                                                      Text('Please Contact',style: TextStyle(fontSize: 16,),textAlign: TextAlign.center,),
                                                      Text('office@drgersch.de',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                                                      Text('to request new login data.',style: TextStyle(fontSize: 16,),textAlign: TextAlign.center,),

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

              Expanded(
                flex: 1,
                child:  Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Container(
                    //        color: Color(0xffCDDFB9),
                    child: Padding(
                        padding: EdgeInsets.only(bottom: 10.0,top: 10.0),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: InkWell(
                                  child: Column(
                                    children: [
                                      Image.asset('assets/imprint.jpg',height: 30,width: 30,),
                                      Text('Imprint',style: TextStyle(color: Colors.black,fontSize: 10,fontWeight: FontWeight.bold),)
                                    ],
                                  ),
                                )),

                            Expanded(
                                flex: 1,
                                child: InkWell(
                                  child: Column(
                                    children: [
                                      Image.asset('assets/clanguage.jpg',height: 30,width: 30,),
                                      Text('Language',style: TextStyle(color: Colors.black,fontSize: 10,fontWeight: FontWeight.bold),)
                                    ],
                                  ),
                                )),

                            Expanded(
                                flex: 1,
                                child: InkWell(
                                  child: Column(
                                    children: [
                                      Image.asset('assets/appointment.png',height: 30,width: 30,),
                                      Text('Appointment',style: TextStyle(color: Colors.black,fontSize: 10,fontWeight: FontWeight.bold),)
                                    ],
                                  ),
                                )),

                            Expanded(
                              flex: 1,
                              child: InkWell(
                                child: Column(
                                  children: [
                                    Image.asset('assets/settings.png',height: 30,width: 30,),
                                    Text('Privacy',style: TextStyle(color: Colors.black,fontSize: 10,fontWeight: FontWeight.bold),)
                                  ],
                                ),
                              ),)


                          ],
                        )
                    ),
                  ),
                ),

              ),
            ],
          )
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      currentPage = index;

    });
  }



}
