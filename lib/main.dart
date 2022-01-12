import 'package:coffee_store_ui/adminhome/addproduct.dart';
import 'package:coffee_store_ui/adminhome/editproduct.dart';
import 'package:coffee_store_ui/pages/Basket.dart';

import 'package:coffee_store_ui/pages/landing_page.dart';
import 'package:coffee_store_ui/pages/shop_page.dart';
import 'package:coffee_store_ui/pages/single_product.dart';
import 'package:coffee_store_ui/provider/cart_item.dart';
import 'package:coffee_store_ui/utils/constants.dart';
import 'package:coffee_store_ui/widgets/coffee_listing.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'adminhome/admin.dart';
import 'adminhome/manageProduct.dart';
import 'pages/AdminPage.dart';
import 'pages/Basket.dart';
import 'pages/SignIn.dart';
import 'pages/SignUp.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  var initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  // var initializationSettingsIOS = IOSInitializationSettings(
  //     requestAlertPermission: true,
  //     requestBadgePermission: true,
  //     requestSoundPermission: true,
  //     onDidReceiveLocalNotification:
  //         (int id, String title, String body, String payload) async {});
  var initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: (String payload) async {
    if (payload != null) {
      debugPrint('notification payload: ' + payload);
    }
  });

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<CartItem>(
            create: (context) => CartItem(),
          ),
        ],
        child: ScreenUtilInit(
          designSize: Size(375, 812),
          //    allowFontScaling: false,
          builder: () => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Flutter Coffee UI",
            theme: ThemeData(
              scaffoldBackgroundColor: kFadedScaffoldColor,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              textTheme: GoogleFonts.poppinsTextTheme(),
            ),
            initialRoute: LandingPage.id,
            routes: {
              LandingPage.id: (context) => LandingPage(),
              SigninScreen.id: (context) => SigninScreen(),
              SignUp.id: (context) => SignUp(),
              ShopPage.id: (context) => ShopPage(),
              basket.id: (context) => basket(),
              SingleProduct.id: (context) => SingleProduct(),
              CoffeeListing.id: (context) => CoffeeListing(),
              AdminPage.id: (context) => AdminPage(),
              AddProduct.id: (context) => AddProduct(),
              ManageProducts.id: (context) => ManageProducts(),
              EditProduct.id: (context) => EditProduct(),
              Admin.id: (context) => Admin(),
            },
          ),
        ));
  }
}

// Learning Git
