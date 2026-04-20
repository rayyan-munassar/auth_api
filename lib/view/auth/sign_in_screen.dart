import 'package:auth_api_integration/res/utils/app_routes.dart';
import 'package:auth_api_integration/view_model/auth/sign_in_view_model.dart';
import 'package:auth_api_integration/widgets/primary_btn.dart';
import 'package:auth_api_integration/widgets/primary_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<SignInViewModel>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              // Title
              const Text(
                "Welcome Back",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 8),

              Text(
                "Sign in to continue",
                style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
              ),

              const SizedBox(height: 50),

              // Email
              PrimaryTextField(
                label: "Username",
                icon: Icons.person,
                controller: vm.usernameCtl,
              ),

              const SizedBox(height: 16),

              // Password
              PrimaryTextField(
                controller: vm.passCtl,
                label: "Password",
                icon: Icons.lock,
                obscureText: true,
              ),

              const SizedBox(height: 10),

              // Forgot password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text("Forgot Password?"),
                ),
              ),

              const SizedBox(height: 20),

              // Sign In Button
              vm.isLoading
                  ? Center(
                      child: CircularProgressIndicator(color: Colors.black),
                    )
                  : PrimaryBtn(
                      title: "Sing In",
                      onTap: () {
                        vm.signIn(context);
                      },
                    ),

              const Spacer(),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don’t have an account? ",
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.signUp);
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
