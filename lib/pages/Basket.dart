import 'package:coffee_store_ui/main.dart';
import 'package:coffee_store_ui/models/coffee.dart';
import 'package:coffee_store_ui/pages/single_product.dart';
import 'package:coffee_store_ui/provider/cart_item.dart';
import 'package:coffee_store_ui/utils/constants.dart';
import 'package:coffee_store_ui/widgets/popMenu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';

class basket extends StatelessWidget {
  static String id = " basket";
  @override
  Widget build(BuildContext context) {
    List<Coffee> products = Provider.of<CartItem>(context).products;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double appBarHeight = AppBar().preferredSize.height;
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      //  resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'My Cart',
          style: TextStyle(color: Colors.black),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          LayoutBuilder(builder: (context, constrains) {
            if (products.isNotEmpty) {
              return Container(
                height: screenHeight -
                    statusBarHeight -
                    appBarHeight -
                    (screenHeight * .08),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(15),
                      child: GestureDetector(
                        onTapUp: (details) {
                          showCustomMenu(details, context, products[index]);
                        },
                        child: Container(
                            height: screenHeight * .25,
                            child: Column(
                              children: [
                                Row(
                                  children: <Widget>[
                                    CircleAvatar(
                                      radius: screenHeight * .15 / 2,
                                      backgroundImage: products[index].image,
                                      //AssetImage(products[index].image),
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Text(
                                                  products[index].name,
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  '\$ ${products[index].price}',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 20),
                                            child: Text(
                                              products[index]
                                                  .pQuantity
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: products[index]
                                      .flaver
                                      .map((e) => Chip(label: Text(e)))
                                      .toList(),
                                )
                              ],
                            ),
                            color: Colors.white // Color(0xFFFFE6AC),
                            ),
                      ),
                    );
                  },
                  itemCount: products.length,
                ),
              );
            } else {
              return Container(
                height: screenHeight -
                    (screenHeight * .08) -
                    appBarHeight -
                    statusBarHeight,
                child: Center(
                  child: Text('Cart is Empty'),
                ),
              );
            }
          }),
          Builder(
            builder: (context) => ButtonTheme(
              minWidth: screenWidth,
              height: screenHeight * .08,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10))),
                onPressed: () {
                  showCustomDialog(products, context);
                },
                child: Text(
                  'Checkout'.toUpperCase(),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                color: Color(0xFFFFC12F),
              ),
            ),
          )
        ],
      ),
    );
  }

  void showCustomMenu(details, context, product) async {
    double dx = details.globalPosition.dx;
    double dy = details.globalPosition.dy;
    double dx2 = MediaQuery.of(context).size.width - dx;
    double dy2 = MediaQuery.of(context).size.width - dy;
    await showMenu(
        context: context,
        position: RelativeRect.fromLTRB(dx, dy, dx2, dy2),
        items: [
          MyPopupMenuItem(
            onClick: () {
              Navigator.pop(context);
              Provider.of<CartItem>(context, listen: false)
                  .deleteProduct(product);
              Navigator.pushNamed(context, SingleProduct.id,
                  arguments: product);
            },
            child: Text('Edit'),
          ),
          MyPopupMenuItem(
            onClick: () {
              Navigator.pop(context);
              Provider.of<CartItem>(context, listen: false)
                  .deleteProduct(product);
            },
            child: Text('Delete'),
          ),
        ]);
  }

  void showCustomDialog(List<Coffee> products, context) async {
    var price = getTotallPrice(products);
    var address = "";
    AlertDialog alertDialog = AlertDialog(
      actions: <Widget>[
        MaterialButton(
          onPressed: () {
            try {
              // Store _store = Store();
              // _store.storeOrders(
              //     {kTotallPrice: price, kAddress: address}, products);
              scheduleAlarm(" Total Price : $price", "Address : $address");
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text('Orderd Successfully'),
              ));
              Navigator.pop(context);
            } catch (ex) {
              print(ex.message);
            }
          },
          child: Text('Confirm'),
        )
      ],
      content: TextField(
        onChanged: (value) {
          address = value;
        },
        decoration: InputDecoration(hintText: 'Enter your Address'),
      ),
      title: Text('Totall Price  = \$ $price'),
    );
    await showDialog(
        context: context,
        builder: (context) {
          return alertDialog;
        });
  }

  getTotallPrice(List<Coffee> products) {
    var totalprice = 0;
    for (var product in products) {
      totalprice += product.pQuantity * (product.price).toInt();
    }
    return totalprice;
  }

  void scheduleAlarm(String title, String body) async {
    var scheduledNotificationDateTime =
        DateTime.now().add(Duration(seconds: 10));

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'alarm_notif',
      'alarm_notif',
      icon: '@mipmap/ic_launcher',
      //   sound: RawResourceAndroidNotificationSound('a_long_cold_sting'),
      largeIcon: DrawableResourceAndroidBitmap('@mipmap/ic_launcher'),
    );

    var iOSPlatformChannelSpecifics = IOSNotificationDetails(
        //   sound: 'a_long_cold_sting.wav',
        presentAlert: true,
        presentBadge: true,
        presentSound: true);
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.schedule(0, title, body,
        scheduledNotificationDateTime, platformChannelSpecifics);
  }

  // void onSaveAlarm() {
  //   DateTime scheduleAlarmDateTime;
  //   if (_alarmTime.isAfter(DateTime.now()))
  //     scheduleAlarmDateTime = _alarmTime;
  //   else
  //     scheduleAlarmDateTime = _alarmTime.add(Duration(days: 1));

  //   var alarmInfo = AlarmInfo(
  //     alarmDateTime: scheduleAlarmDateTime,
  //     gradientColorIndex: _currentAlarms.length,
  //     title: 'alarm',
  //   );
  //   _alarmHelper.insertAlarm(alarmInfo);
  //   scheduleAlarm(scheduleAlarmDateTime, alarmInfo);
  //   Navigator.pop(context);
  //   loadAlarms();
  // }

  // void deleteAlarm(int id) {
  //   _alarmHelper.delete(id);
  //   //unsubscribe for notification
  //   loadAlarms();
  // }
}
