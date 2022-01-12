import 'package:coffee_store_ui/pages/SignIn.dart';
import 'package:coffee_store_ui/utils/constants.dart';
import 'package:coffee_store_ui/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class LandingPage extends StatelessWidget {
  static String id = "LandingPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Container(
        child: Stack(
          children: [
            Positioned(
              top: 0.0,
              right: -70.0,
              child: Image.asset(
                "assets/images/coffee2.png",
              ),
            ),
            Positioned(
              left: -70.0,
              bottom: 0.0,
              child: Image.asset(
                "assets/images/coffee.png",
              ),
            ),
            Positioned(
              right: -70.0,
              bottom: -10.0,
              child: Image.asset(
                "assets/images/coffee_cup.png",
                width: 250.0,
              ),
            ),
            Positioned(
              top: 0.0,
              left: 0.0,
              width: MediaQuery.of(context).size.width,

              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                height: MediaQuery.of(context).size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 200.0,
                    ),
                    Text(
                      "Shop Best\nCoffee In\nAmman",
                      style: TextStyle(
                        fontSize: 40.0,
                        height: 1.3,
                        color: kTextColor1,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      "Experience the best taste of coffee with us exclusively",
                      style: TextStyle(
                        fontSize: 18.0,
                        height: 1.8,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Container(
                      height: ScreenUtil().setHeight(48.0),
                      child: FlatButton(
                        padding: EdgeInsets.symmetric(horizontal: 32.0),
                        onPressed: () {
                          Navigator.pushNamed(context, SigninScreen.id);
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28.0),
                        ),
                        child: Text(
                          "Try Know",
                          style: TextStyle(
                              fontSize: 25.0, fontWeight: FontWeight.bold,color: Colors.black),
                        ),

                        color: kTextColor1,
                      ),

                    ),




                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
