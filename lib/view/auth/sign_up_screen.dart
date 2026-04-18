import 'package:auth_api_integration/view_model/auth/sign_up_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../widgets/primary_btn.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final vm = context.watch<SignUpViewModel>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior: .onDrag,
          child: Padding(
            padding: EdgeInsets.only(
              left: 24,
              right: 24,
              bottom: MediaQuery.of(context).viewInsets.bottom, // 🔥 KEY FIX
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(Icons.arrow_back),
                ),
                SizedBox(height: 20),

                // Title
                const Text(
                  "Create Account",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 8),

                Text(
                  "Sign up to get started",
                  style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
                ),

                const SizedBox(height: 40),

                // Full Name
                _buildTextField(
                  label: "Username",
                  icon: Icons.person,
                  controller: vm.usernameCtl,
                ),

                const SizedBox(height: 16),

                // Email
                _buildTextField(
                  label: "Email",
                  icon: Icons.email,
                  controller: vm.emailCtl,
                ),

                const SizedBox(height: 16),

                // Password
                _buildTextField(
                  controller: vm.passCtl,
                  label: "Password",
                  icon: Icons.lock,
                  obscureText: true,
                ),

                const SizedBox(height: 16),

                // Confirm Password
                _buildTextField(
                  controller: vm.confirmPassCtl,
                  label: "Confirm Password",
                  icon: Icons.lock_outline,
                  obscureText: true,
                ),

                const SizedBox(height: 30),

                // Sign Up Button
                vm.isLoading
                    ? Center(child: CircularProgressIndicator())
                    : PrimaryBtn(
                        title: "Sign Up",
                        onTap: () {
                          vm.signUp(context);
                        },
                      ),

                const SizedBox(height: 40),

                // Bottom login link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: const Text(
                        "Login",
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
      ),
    );
  }
}

Widget _buildTextField({
  required String label,
  required IconData icon,
  required TextEditingController controller,
  bool obscureText = false,
}) {
  return TextField(
    obscureText: obscureText,
    controller: controller,
    decoration: InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon),
      filled: true,
      fillColor: Colors.grey.shade100,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    ),
  );
}
