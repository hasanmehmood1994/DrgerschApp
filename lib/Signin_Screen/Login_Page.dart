import 'package:drgerschapp/Language.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
        resizeToAvoidBottomInset: true,
        body:  Container(
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
                                  onPressed: () {},
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

                        },
                      ),
                      //   FadeAnimation(1.5, Text("Forgot Password?", style: TextStyle(color:Color.fromRGBO(0, 137, 172, 1)),)),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),

        bottomNavigationBar:  BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Image.asset('assets/imprint.png',color: Colors.black,height: 30,width: 30,),
              title: Text('Imprint',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.white),),
              activeIcon: Image.asset('assets/imprint.png',color:  Colors.white,height: 30,width: 30,),
              backgroundColor: Color(0xffCDDFB9),
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/lang.png',color: Colors.black,height: 30,width: 30,),
              title: Text('Language',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.white),),
              activeIcon: Image.asset('assets/lang.png',color:  Colors.white,height: 30,width: 30,),
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/appointment.png',color: Colors.black,height: 30,width: 30,),
              title: Text('Appointment',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.white),),
              activeIcon: Image.asset('assets/appointment.png',color:  Colors.white,height: 30,width: 30,),
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/privacy.png',color: Colors.black,height: 30,width: 30,),
              title: Text('Privacy',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.white),),
              activeIcon: Image.asset('assets/privacy.png',color:  Colors.white,height: 30,width: 30,),
            ),
          ],
          currentIndex: currentPage,
          selectedItemColor: Color(0xffCDDFB9),
          unselectedItemColor: Colors.black,
          onTap: _onItemTapped,
        ),

      ),
      );
  }

  void _onItemTapped(int index) {
    setState(() {
      currentPage = index;

    });
  }

}
