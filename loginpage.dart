import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsupdate/userauthentication/authentication_service.dart';


import 'package:provider/provider.dart';

import '../home.dart';

TextEditingController emailcontroller=new TextEditingController();
TextEditingController passwordcontroller=new TextEditingController();


class Loginpage extends StatefulWidget {
  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final _formloginkey= GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage("https://images.wallpaperscraft.com/image/newspaper_coffee_cup_spoon_sunglasses_news_cup_holder_84893_1280x720.jpg"),
                fit: BoxFit.cover)
        ),
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height*0.6,width: MediaQuery.of(context).size.width*0.9,
          child: Card(
                  color: Colors.transparent,
            child: Form(
                key: _formloginkey,
              child: Column(
                children: [
                  Text('LogIn',style: GoogleFonts.kanit(fontSize: 30.0,color: Colors.white),),
                  SizedBox(height: 40.0,),
                  TextFormField(
                    style: GoogleFonts.kanit(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.white),
                    controller: emailcontroller,
                    validator: (String val){
                      if(val.isEmpty){
                        return 'Please Enter the Email id';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(FontAwesomeIcons.userAlt,color: Colors.grey,),
                      filled: true,
                      labelText: 'UserEmail Id',
                      labelStyle: GoogleFonts.kanit(color: Colors.white),
                      hintText: 'Enter your Email ID',
                      hintStyle: GoogleFonts.kanit(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey,),
                        borderRadius: BorderRadius.all(Radius.circular(30)),

                      ),
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  TextFormField(
                    style: GoogleFonts.kanit(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.white),
                    controller: passwordcontroller,
                    validator: (String val){
                      if(val.isEmpty){
                        return 'Please Enter the Password';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(FontAwesomeIcons.userAlt,color: Colors.grey,),
                      filled: true,
                      labelText: 'Password',
                      labelStyle: GoogleFonts.kanit(color: Colors.white),
                      hintText: 'Enter your password',
                      hintStyle: GoogleFonts.kanit(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey,),
                        borderRadius: BorderRadius.all(Radius.circular(30)),

                      ),
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      RaisedButton(
                        color: Colors.green,
                      onPressed: (){
                        if (_formloginkey.currentState.validate()) {
                          (context).read<AuthenticationService>().signIn(
                            email: emailcontroller.text.trim(),
                            password: passwordcontroller.text.trim(),
                          ).then((_) => Navigator.push(context, MaterialPageRoute(builder: (context){
                            return Home();
                          })));

                          emailcontroller.clear();
                          passwordcontroller.clear();
                        }

                      },
                      child: Text('LogIn',style: GoogleFonts.kanit(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.white)),),
                    ],
                  ),
                ],
              ),
            ),
          ),
          ),
        ),
      ),
    );
  }
}

