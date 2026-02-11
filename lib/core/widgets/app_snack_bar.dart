import 'package:docdoc/core/utils/txt_style.dart';
import 'package:flutter/material.dart';
import '../utils/colors_manager.dart';


class AppSnackBar {

  static void show(
      BuildContext context, {
        required String message,

      }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TxtStyle.size16Weight600White,
        ),
        backgroundColor:  ColorsManager.primary,
        duration: Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.all(16),
      ),
    );
  }
}
