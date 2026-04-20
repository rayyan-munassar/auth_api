import 'package:auth_api_integration/view/auth/sign_in_screen.dart';
import 'package:auth_api_integration/view/auth/sign_up_screen.dart';
import 'package:auth_api_integration/view/btm_nav_bar/btm_nav_bar_screen.dart';
import 'package:auth_api_integration/view/btm_nav_bar/home/product_details/product_details_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  AppRoutes._();

  static const String signIn = "/SignIn";
  static const String signUp = "/SignUp";
  static const String btmNavBar = "/BtmNavBar";
  static const String productDetails = "/ProductDetails";

  static List<GetPage> pages = [
    GetPage(name: signIn, page: () => SignInScreen()),
    GetPage(name: signUp, page: () => SignUpScreen()),
    GetPage(name: btmNavBar, page: () => BtmNavBarScreen()),
    GetPage(name: productDetails, page: () => ProductDetailScreen()),
  ];
}
