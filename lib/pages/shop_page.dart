// import 'package:badges/badges.dart';
import 'package:coffee_store_ui/pages/Basket.dart';
import 'package:coffee_store_ui/utils/constants.dart';
import 'package:coffee_store_ui/utils/static_data.dart';
import 'package:coffee_store_ui/widgets/coffee_listing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Basket.dart';
import 'package:carousel_pro/carousel_pro.dart';


class ShopPage extends StatefulWidget {
  static String id=" ShopPage";
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {

  // Keep track of active tab
  int _activeTab = 0;
  List<Widget> pages = [CoffeeListing(), SizedBox(), CoffeeListing()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Positioned(
              top: 0.0,
              left: 100.0,
              child: Opacity(
                opacity: 0.1,
                child: Image.asset(
                  "assets/images/coffee2.png",
                  width: 150.0,
                ),
              ),
            ),
            Positioned(
              top: 0.0,
              right: -180.0,
              child: Image.asset(
                "assets/images/square.png",
              ),
            ),
            // Positioned(
            //   child: Image.asset(
            //     "assets/images/drum.png",
            //   ),
            //   left: -70.0,
            //   bottom: -40.0,
            // ),
            SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.0,
                    vertical: 10.0,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              FlutterIcons.keyboard_backspace_mdi,
                              size: 35,
                            ),
                          ),
                          Container(
                            child: IconButton(icon: Icon(
                              Icons.shopping_cart, size: 40,),
                              onPressed: () {
                              Navigator.of(context).pushNamed(basket.id);

                              },),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 24.0,
                      ),
                      Text(
                        "Coffee hunter",
                        style: TextStyle(
                          color: StarB,
                          fontSize: 24.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),

                      Text(
                        "Best cafe in amman",
                        style: TextStyle(
                          color: StarB,
                          fontSize: 22.0,
                          fontWeight: FontWeight.w300,
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(top: 20.0),
                        height: ScreenUtil().setHeight(60.0),
                        child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          // Let's create a model for categories and populate with data.
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  _activeTab = index;
                                });
                              },
                              // Little switch animation
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 450),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20.0,
                                ),
                                height: ScreenUtil().setHeight(48.0),
                                decoration: BoxDecoration(
                                  color: _activeTab == index
                                      ? StarB
                                      : kTextColor1.withOpacity(
                                    .2,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Center(
                                  child: Text(
                                    StaticData.categories[index].name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: _activeTab == index
                                          ? Colors.white
                                          : StarB,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              width: 16.0,
                            );
                          },
                          itemCount: StaticData.categories.length,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),


                      // Lets make a dummy page switch
                      AnimatedSwitcher(
                        duration: Duration(
                          milliseconds: 450,
                        ),
                        child: pages[_activeTab],
                      ),

                      Container(
                        height:MediaQuery.of(context).size.height*0.20 ,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.pink,
                        child:Carousel(

                          autoplay: true,
                          showIndicator: false,
                          dotBgColor: Colors.pinkAccent,

                          dotSize: 20,
                          images: [
                            AssetImage("assets/images/logo2.png"),
                            AssetImage("assets/images/9.png"),
                            AssetImage("assets/images/10.png"),
                            // AssetImage("assets/images/7.png"),
                            AssetImage("assets/images/11.png"),
                            AssetImage("assets/images/12.png"),


                          ],
                        ) ,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
