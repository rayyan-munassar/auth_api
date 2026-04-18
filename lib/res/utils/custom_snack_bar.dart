import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/app_colors.dart';

class CustomSnackBar {
  static void showError({
    required String message,
    String title = "Error",
    required IconData icon,
    Color backgroundColor = AppColors.error,
  }) {
    Get.snackbar(
      title,
      message,
      backgroundColor: backgroundColor.withOpacity(.9),
      colorText: Colors.white,
      snackPosition: .TOP,
      icon: Icon(icon, color: Colors.white, size: 28),
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      borderRadius: 12,
      duration: Duration(seconds: 3),
      boxShadows: [
        BoxShadow(
          color: backgroundColor.withOpacity(0.3),
          blurRadius: 12,
          offset: const Offset(0, 4),
        ),
      ],
      shouldIconPulse: true,
    );
  }

  static void showSuccess({
    required String message,
    String title = "Success",
    required IconData icon,
    Color backgroundColor = AppColors.success,
  }) {
    Get.snackbar(
      title,
      message,
      backgroundColor: backgroundColor.withOpacity(.9),
      colorText: Colors.white,
      snackPosition: .TOP,
      icon: Icon(icon, color: Colors.white, size: 28),
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      borderRadius: 12,
      duration: Duration(seconds: 3),
      boxShadows: [
        BoxShadow(
          color: backgroundColor.withOpacity(0.3),
          blurRadius: 12,
          offset: const Offset(0, 4),
        ),
      ],
      shouldIconPulse: true,
    );
  }

  // void _show()
}
