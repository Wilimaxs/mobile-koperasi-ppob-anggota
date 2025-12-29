import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin DialogMixin {
  // ==================== SNACKBAR ====================

  /// Base method for show snackbar
  void _showSnackbar(
    String title,
    String message,
    Color bgColor,
    IconData icon,
  ) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: bgColor,
      colorText: Colors.white,
      icon: Icon(icon, color: Colors.white),
      margin: const EdgeInsets.all(15),
      duration: const Duration(seconds: 3),
    );
  }

  /// Show success snackbar (green)
  void showSuccessSnackbar(String message) {
    _showSnackbar("Success", message, Colors.green, Icons.check_circle);
  }

  // Show error snackbar (red)
  void showErrorSnackbar(String message) {
    _showSnackbar("Error", message, Colors.red, Icons.error);
  }

  // Show warning snackbar (orange)
  void showWarningSnackbar(String message) {
    _showSnackbar("Warning", message, Colors.orange, Icons.warning);
  }

  // Show info snackbar (blue)
  void showInfoSnackbar(String message) {
    _showSnackbar("Info", message, Colors.blue, Icons.info);
  }

  // ==================== DIALOG ====================

  /// Show loading dialog
  void showLoading({String message = "Loading..."}) {
    Get.dialog(
      PopScope(
        canPop: false,
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircularProgressIndicator(),
                const SizedBox(height: 16),
                Text(
                  message,
                  style: const TextStyle(
                    fontSize: 14,
                    decoration: TextDecoration.none,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  /// Hide loading dialog
  void hideLoading() {
    if (Get.isDialogOpen ?? false) {
      Get.back();
    }
  }

  Future<void> showAlert({
    required String title,
    required String message,
  }) async {
    await Get.defaultDialog(
      title: title,
      middleText: message,
      textConfirm: "OK",
      confirmTextColor: Colors.white,
      onConfirm: () => Get.back(),
    );
  }
}
