import 'package:coffee_store_ui/pages/Basket.dart';
import 'package:coffee_store_ui/pages/SignUp.dart';
import 'package:coffee_store_ui/utils/constants.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import 'addproduct.dart';
import 'manageProduct.dart';

class Admin extends StatelessWidget {
  static String id = 'Admin';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Admin Page',style: TextStyle(fontSize: 30.0),)),
        backgroundColor: Colors.blue[900],
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: double.infinity,
          ),
          RaisedButton(
            color: Colors.blue[900],
            onPressed: () {
              Navigator.pushNamed(context, AddProduct.id);
            },
            child: Text(
              'Add Product',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          RaisedButton(
            color: Colors.blue[900],
            onPressed: () {
              Navigator.pushNamed(context, ManageProducts.id);
            },
            child: Text(
              'Edit Product',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          RaisedButton(
            color: Colors.blue[900],
            onPressed: () {
              Navigator.pushNamed(context, basket.id);
            },
            child: Text(
              'View orders',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
