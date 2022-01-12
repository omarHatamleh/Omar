import 'package:coffee_store_ui/utils/Custome_textField.dart';
import 'package:coffee_store_ui/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'SignIn.dart';
import 'package:flutter/material.dart';
import 'package:coffee_store_ui/utils/auth.dart';

class SignUp extends StatelessWidget {
  static String id="SignUp";
  String _email, _password;
  final _auth = Auth();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: _globalKey,
          child: ListView(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .3,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      "assets/images/C.jpg",
                    ),
                  ],
                ),
              ),

              SizedBox(height: height * .02),

              CustomTextField(
                label: "Enter your Fname" ,

                icon: Icons.person,

              ),
              SizedBox(height: height * .02),
              CustomTextField(
                label: "Enter your Lname",
                icon: Icons.person,
              ),
              SizedBox(height: height * .02),
              CustomTextField(
                onClick: (value) {
                  _email = value;
                },
                label: "Enter your Email",
                icon: Icons.email_rounded,
              ),
              SizedBox(height: height * .02),
              CustomTextField(
                onClick: (value) {
                  _password =value;
                },
                label: "Enter your Password",
                icon: Icons.lock,
              ),
              SizedBox(height: height * .02),
              CustomTextField(
                label: "Confierm password",
                icon: Icons.lock,
              ),
              SizedBox(height: height * .02),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 120.0),
                child: Builder(
                  builder:(context)=> FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    onPressed: ()async
                    {

                      if (_globalKey.currentState.validate())
                      {

                        _globalKey.currentState.save();
                        print(_email);
                        print(_password);

                        try{
                      final authResult= await _auth.SignUp(_email, _password,);
                       print (authResult.user.uid);

                           Navigator.pushNamed(context, SigninScreen.id);

                          }on PlatformException catch(e)
                    {
                           Scaffold.of(context).showSnackBar(SnackBar(content: Text(e.message)));
                     }

                      };

                    },
                    color: Colors.brown[900],
                    child: Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  ),
                ),
              ),
              SizedBox(height: height * .02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    ' have an account ?',
                    style: TextStyle(
                        color: Colors.brown[900],
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, SigninScreen.id);
                    },
                    child: Text(
                      'LogIn',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
