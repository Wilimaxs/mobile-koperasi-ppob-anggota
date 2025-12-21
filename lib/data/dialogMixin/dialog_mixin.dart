import 'package:flutter/material.dart';

mixin DialogMixin {
  BuildContext? _context;

  void setContext(BuildContext context) {
    _context = context;
  }

  BuildContext get context {
    if (_context == null) {
      throw Exception(
        'Context not set. Please call setContext() before accessing context.',
      );
    }
    return _context!;
  }

  bool get hasContext => _context != null;

  // ==================== SNACKBAR ====================

  /// Show success snackbar (green)
  void showSuccessSnackbar(String message, {Duration? duration}) {
    _showSnackbar(
      message: message,
      backgroundColor: Colors.green,
      icon: Icons.check_circle,
      duration: duration,
    );
  }

  /// Show error snackbar (red)
  void showErrorSnackbar(String message, {Duration? duration}) {
    _showSnackbar(
      message: message,
      backgroundColor: Colors.red,
      icon: Icons.error,
      duration: duration,
    );
  }

  /// Show warning snackbar (orange)
  void showWarningSnackbar(String message, {Duration? duration}) {
    _showSnackbar(
      message: message,
      backgroundColor: Colors.orange,
      icon: Icons.warning,
      duration: duration,
    );
  }

  /// Show info snackbar (blue)
  void showInfoSnackbar(String message, {Duration? duration}) {
    _showSnackbar(
      message: message,
      backgroundColor: Colors.blue,
      icon: Icons.info,
      duration: duration,
    );
  }

  /// Base method for show snackbar
  void _showSnackbar({
    required String message,
    required Color backgroundColor,
    required IconData icon,
    Duration? duration,
  }) {
    if (!hasContext) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 12),
            Expanded(
              child: Text(message, style: const TextStyle(color: Colors.white)),
            ),
          ],
        ),
        backgroundColor: backgroundColor,
        duration: duration ?? const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  // ==================== DIALOG ====================

  /// Show loading dialog
  void showLoading({String? message}) {
    if (!hasContext) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => PopScope(
        canPop: false,
        child: Dialog(
          backgroundColor: Colors.transparent,
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
                if (message != null) ...[
                  const SizedBox(height: 16),
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Hide loading dialog
  void hideLoading() {
    if (!hasContext) return;
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }

  /// Show confirmation dialog
  Future<bool> showConfirm({
    required String title,
    required String message,
    String confirmText = 'Yes',
    String cancelText = 'No',
    Color? confirmColor,
  }) async {
    if (!hasContext) return false;

    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(cancelText),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(
              foregroundColor: confirmColor ?? Colors.red,
            ),
            child: Text(confirmText),
          ),
        ],
      ),
    );

    return result ?? false;
  }

  /// Show alert dialog
  Future<void> showAlert({
    required String title,
    required String message,
    String buttonText = 'OK',
  }) async {
    if (!hasContext) return;

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(buttonText),
          ),
        ],
      ),
    );
  }

  /// Show custom dialog
  Future<T?> showCustomDialog<T>({
    required Widget child,
    bool barrierDismissible = true,
  }) async {
    if (!hasContext) return null;

    return await showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) => child,
    );
  }
}
