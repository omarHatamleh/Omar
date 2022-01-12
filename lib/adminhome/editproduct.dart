import 'package:coffee_store_ui/models/Products.dart';
import 'package:coffee_store_ui/utils/Custome_textField.dart';
import 'package:coffee_store_ui/utils/store.dart';
import 'package:flutter/material.dart';
class EditProduct extends StatelessWidget {
  static String id=" EditProduct";
  String _name,_price,_category,_location,_decription;
  final _store=Store();
  GlobalKey<FormState>_globalKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _globalKey,
        child: ListView(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomTextField(
                    onClick: (value)
                    {
                      _name=value;
                    },
                    label: "Product Name",
                  ),
                  SizedBox(height: 10,)  ,
                  CustomTextField(
                    onClick: (value)
                    {
                      _price=value;
                    },
                    label: " Product Price",
                  ),
                  SizedBox(height: 10,)  ,

                  CustomTextField(
                    onClick: (value)
                    {
                      _category=value;
                    },
                    label: "Product Category",
                  ),

                  SizedBox(height: 10,)  ,
                  CustomTextField(
                    onClick: (value)
                    {
                      _decription=value;
                    },
                    label: "Product Description",
                  ),
                  SizedBox(height: 10,)  ,

                  CustomTextField(
                    onClick: (value)
                    {
                      _location=value;
                    },
                    label: "Product Location",
                  ),
                  SizedBox(height: 20,)  ,

                  FlatButton(
                      onPressed: ()
                      {
                        if(_globalKey.currentState.validate())
                        {
                          _globalKey.currentState.save();
                          _store.addProduct(Product(
                              pName: _name,
                              pPrice: _price,
                              pLocation: _location,
                              pCategory: _category));


                        }
                      },
                      child: Text("Edit"))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
