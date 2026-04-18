import 'package:auth_api_integration/view/auth/sign_in_screen.dart';
import 'package:auth_api_integration/view/btm_nav_bar/btm_nav_bar_screen.dart';
import 'package:auth_api_integration/view_model/auth/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<AuthViewModel>().loadUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    final authVM = context.watch<AuthViewModel>();

    if (authVM.isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    if (authVM.isLoggedIn) {
      return const BtmNavBarScreen();
    } else {
      return const SignInScreen();
    }
  }
}
