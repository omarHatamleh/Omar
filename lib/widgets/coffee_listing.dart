import 'package:coffee_store_ui/pages/Basket.dart';
import 'package:coffee_store_ui/pages/Basket.dart';
import 'package:coffee_store_ui/pages/single_product.dart';
import 'package:coffee_store_ui/utils/constants.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:coffee_store_ui/utils/static_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

// https://pub.dev/packages/flutter_staggered_grid_view
class CoffeeListing extends StatelessWidget {
  static String id = "CoffeeListing";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StaggeredGridView.countBuilder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        // Lets create a coffee model and populate it
        itemCount: StaticData.coffees.length,
        crossAxisCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, SingleProduct.id,
                  arguments: StaticData.coffees[index]);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(0, 2),
                      blurRadius: 4.0,
                    )
                  ],
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: StaticData.coffees[index].image,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 5.0,
                        vertical: 5.0,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            StaticData.coffees[index].name,
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            StaticData.coffees[index].description,
                            style: TextStyle(
                              fontSize: 14.0,
                              color: kTextColor1,
                            ),
                          ),
                          Divider(),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 8.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${StaticData.coffees[index].price.toStringAsFixed(2)} JD",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: IconButton(
                                    icon: Icon(
                                      FlutterIcons.add_circle_mdi,
                                      size: 30,
                                      color: Colors.black,
                                    ),
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, SingleProduct.id,
                                          arguments: StaticData.coffees[index]);
                                    },

                                    //FlutterIcons.add_circle_mdi,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
        staggeredTileBuilder: (int index) => StaggeredTile.count(2, 3),
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
      ),
    );
  }
}
