import 'package:auth_api_integration/res/utils/app_routes.dart';
import 'package:auth_api_integration/res/utils/themes.dart';
import 'package:auth_api_integration/view/auth_gate.dart';
import 'package:auth_api_integration/view_model/auth/auth_view_model.dart';
import 'package:auth_api_integration/view_model/auth/sign_in_view_model.dart';
import 'package:auth_api_integration/view_model/auth/sign_up_view_model.dart';
import 'package:auth_api_integration/view_model/btm_nav_bar/btm_nav_bar_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("auth");

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SignUpViewModel()),
        ChangeNotifierProvider(create: (_) => SignInViewModel()),
        ChangeNotifierProvider(create: (_) => BtmNavBarViewModel()),
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter & API',
      theme: Themes.themeData,
      home: const AuthGate(),
      getPages: AppRoutes.pages,
    );
  }
}
