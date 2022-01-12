import 'package:coffee_store_ui/models/Products.dart';
import 'package:coffee_store_ui/models/coffee.dart';
import 'package:coffee_store_ui/pages/Basket.dart';
import 'package:coffee_store_ui/provider/cart_item.dart';
import 'package:coffee_store_ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:provider/provider.dart';

class SingleProduct extends StatefulWidget {
  static String id = "SingleProduct";

  @override
  _SingleProductState createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  int _count = 1;
  List<String> flavers = [];
  void addFlaver({String name, BuildContext context}) {
    if (flavers.contains(name)) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Added Before'),
        duration: Duration(milliseconds: 400),
      ));
    } else {
      setState(() {
        flavers.add(name);
      });
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Added to Cart'),
        duration: Duration(milliseconds: 400),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    Coffee product = ModalRoute.of(context).settings.arguments;
    print(">>>>>>>>>>>>>>>> ${product.price}");
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
            Positioned(
              left: -70.0,
              bottom: -40.0,
              child: Image.asset(
                "assets/images/drum.png",
              ),
            ),
            Positioned(
              top: 0.0,
              width: MediaQuery.of(context).size.width,
              child: Container(
                height: 300.0,
                width: double.infinity,
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      "assets/images/logo2.png",
                    ),
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: kToolbarHeight,
                    horizontal: 16.0,
                  ),
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      FlutterIcons.keyboard_backspace_mdi,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 270.0,
              width: MediaQuery.of(context).size.width,
              child: Container(
                height: MediaQuery.of(context).size.height - 280.0,
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 24.0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          "Add you favorite flavor ",
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 24.0,
                          ),
                        ),

                        ///////////////////
                        Builder(
                          builder: (context) => Container(
                            height: 118,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                buildIngredientItem(
                                    'Water',
                                    IconButton(
                                      icon: Icon(
                                        Feather.droplet,
                                        size: 24.0,
                                        color: Colors.white,
                                      ),
                                      onPressed: () =>addFlaver(context: context,name:'Water'),
                                      color: Colors.white,
                                    ),
                                    Color(0xFF6FC5DA)),
                                buildIngredientItem(
                                    'Espresso',
                                    IconButton(
                                        icon: Icon(
                                          Feather.target,
                                          size: 24.0,
                                          color: Colors.white,
                                        ),
                                       onPressed: () =>addFlaver(context: context,name:'Espresso'),
                                        color: Colors.white),
                                    Color(0xFF615955)),
                                buildIngredientItem(
                                    'Sugar',
                                    IconButton(
                                        icon: Icon(
                                          MaterialCommunityIcons.crop_square,
                                          size: 24.0,
                                          color: Colors.white,
                                        ),
                                    onPressed: () =>addFlaver(context: context,name:'Sugar'),
                                        color: Colors.white),
                                    Color(0xFFF39595)),
                                buildIngredientItem(
                                    'Milk',
                                    IconButton(
                                        icon: Icon(
                                          MaterialCommunityIcons.cup_water,
                                          size: 26.0,
                                          color: Colors.white,
                                        ),
                                      onPressed: () =>addFlaver(context: context,name:'Milk'),
                                        color: Colors.white),
                                    Color.fromRGBO(150, 170, 173, 1)),
                                buildIngredientItem(
                                    'Toffee Nut',
                                    IconButton(
                                        icon: Icon(
                                          MaterialCommunityIcons.peanut_outline,
                                          size: 28.0,
                                          color: Colors.white,
                                        ),
                                         onPressed: () =>addFlaver(context: context,name:'Toffee Nut'),
                                        color: Colors.white),
                                    Color(0xFF8FC28A)),
                                buildIngredientItem(
                                    'Vanilla Syrup',
                                    IconButton(
                                        icon: Icon(
                                          MaterialCommunityIcons
                                              .flower_tulip_outline,
                                          size: 26.0,
                                          color: Colors.white,
                                        ),
                                     onPressed: () =>addFlaver(context: context,name:'Vanilla Syrup'),
                                        color: Colors.white),
                                    Color(0xFFF8B870)),
                                buildIngredientItem(
                                    'Natural Flavors',
                                    IconButton(
                                        icon: Icon(
                                          MaterialCommunityIcons.leaf_maple,
                                          size: 26,
                                          color: Colors.white,
                                        ),
                                        onPressed: () =>addFlaver(context: context,name:'Natural Flavors'),
                                        color: Colors.white),
                                    Color(0xFF3B8079)),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 10.0,
                        ),

                        Divider(
                          thickness: 1.5,
                          color: Colors.grey[800],
                        ),
                        Container(
                          height: 60,
                          child: Row(
                            children: <Widget>[
                              Text(
                                "Quantity",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              SizedBox(
                                width: 145.0,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.0),
                                  color: Colors.grey[300],
                                ),
                                child: IconButton(
                                  onPressed: _incrementCounter,
                                  icon: Icon(
                                    Icons.add,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              Container(
                                child: Text(
                                  '$_count',
                                  style: TextStyle(fontSize: 22.0),
                                ),
                              ),
                              SizedBox(
                                width: 22.0,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.0),
                                  color: Colors.grey[300],
                                  //Border.all(color: Colors.grey[800]),
                                ),
                                child: IconButton(
                                  onPressed: _decrement,
                                  icon: Icon(
                                    Icons.remove,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Divider(
                          thickness: 1.5,
                          color: Colors.grey[800],
                        ),
                        doubleColText("Total Amount", "${product.price} JD"),
                        SizedBox(
                          height: 26.0,
                        ),
                        Container(
                          width: double.infinity,
                          height: ScreenUtil().setHeight(60.0),
                          child: Builder(
                            builder: (context) => FlatButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              color: Colors.grey[800],
                              onPressed: () {
                                addToCart(context, product);

////

                                //  Navigator.of(context).pushNamed(basket.id);
                              },
                              child: Text(
                                "Add to my cart",
                                style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget doubleColText(String textOne, String textTwo) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 12.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            textOne,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          Text(
            textTwo,
            style: TextStyle(
              color: Colors.grey[900],
            ),
          ),
        ],
      ),
    );
  }

  void _incrementCounter() {
    setState(() {
      _count++;
    });
  }

  void _decrement() {
    if (_count > 1) {
      setState(() {
        _count--;
      });
    }
  }

  void addToCart(context, product) {
    CartItem cartItem = Provider.of<CartItem>(context, listen: false);
    product.pQuantity = _count;
    product.flaver = flavers;
    bool exist = false;
    var productsInCart = cartItem.products;
    for (var productInCart in productsInCart) {
      if (productInCart.name == product.name) {
        exist = true;
      }
    }
    if (exist) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('you\'ve added this item before'),
        duration: Duration(milliseconds: 400),
      ));
    } else {
      cartItem.addProduct(product);
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Added to Cart'),
        duration: Duration(milliseconds: 400),
      ));
      Navigator.of(context).pushNamed(basket.id);
    }
  }
}

buildIngredientItem(String name, IconButton iconName, Color bgColor) {
  return Padding(
      padding: EdgeInsets.only(right: 10.0),
      child: Column(children: [
        Container(
            height: 60.0,
            width: 70.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0), color: bgColor),
            child: Center(child: iconName)),
        SizedBox(height: 3.0),
        Container(
            width: 60.0,
            child: Center(
                child: Text(name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'nunito',
                        fontWeight: FontWeight.bold,
                        fontSize: 13.0,
                        color: Colors.grey[800]))))
      ]));
}
