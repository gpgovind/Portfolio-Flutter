import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class APPToastMessage {
  static shoW(String message, bool isError) {
    toastification.show(
      style: ToastificationStyle.fillColored,
      type: isError ? ToastificationType.error : ToastificationType.success,
      title: Text(
        message,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      autoCloseDuration: const Duration(seconds: 5),
    );
  }
}
