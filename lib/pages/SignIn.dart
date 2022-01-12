import 'package:coffee_store_ui/adminhome/admin.dart';
import 'package:coffee_store_ui/pages/AdminPage.dart';
import 'package:coffee_store_ui/pages/SignUp.dart';
import 'package:coffee_store_ui/pages/shop_page.dart';
import 'package:coffee_store_ui/utils/Custome_textField.dart';
import 'package:coffee_store_ui/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:coffee_store_ui/utils/auth.dart';
import 'package:flutter/services.dart';


class SigninScreen extends StatelessWidget {
  static String id="SigninScreen";
  String email, password;
  final _auth = Auth();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  bool isAdmin= false;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
        body: Container(

      child: Form(
        key: _globalKey,
        child: ListView(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .4,
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
              onClick:  (value) {
                email = value;
              },
              label: "Email",


              icon: Icons.email_rounded,
            ),
            SizedBox(height: height * .02),
            CustomTextField(

              onClick:  (value) {
                password = value;
              },
              label: "Password",
              icon: Icons.person,

            ),
            SizedBox(height: height * .04),
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80.0),
                child: Builder(
                  builder: (context) => FlatButton(
                    height: 50.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    onPressed: () async {

                       if(email.toUpperCase().contains ("ADMIN")&&password=='112233' ) {

                         _globalKey.currentState.save();
                         try {
                           final result =
                           await _auth.SigninScreen(email, password);


                           Navigator.pushNamed(context, Admin.id);
                           print(result.user.uid);
                         } on PlatformException catch (e) {
                           Scaffold.of(context)
                               .showSnackBar(
                               SnackBar(content: Text(e.message)));
                         }
                       }
                     else if(_globalKey.currentState.validate()&&!email.toUpperCase().contains("ADMIN")) {
                        _globalKey.currentState.save();
                        try {
                          final result =
                              await _auth.SigninScreen(email, password);
                          Navigator.pushNamed(context, ShopPage.id);
                          print(result.user.uid);
                        } on PlatformException catch (e) {
                          Scaffold.of(context)
                              .showSnackBar(SnackBar(content: Text(e.message)));
                        }
                      }

                    },

                    color: Colors.brown[900],
                    child: Text(
                      'LogIn',
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: height * .04),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Dont\'t have an account ?',
                  style: TextStyle(
                      color: Colors.brown[900],
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, SignUp.id);
                  },
                  child: Text(
                    'Sign Up',
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
      ),
    ));
  }
}
