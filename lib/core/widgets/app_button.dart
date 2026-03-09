import 'dart:math';
import 'package:docdoc/core/utils/colors_manager.dart';
import 'package:flutter/material.dart';
import '../utils/txt_style.dart';

class AppButton extends StatelessWidget {
   String buttonTxt;
   Function function;
   AppButton(
      {
        super.key, required this.buttonTxt,
        required this.function,
      });

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double resp =min(screenHeight, screenWidth);

    return InkWell(
      onTap: () => function(),
      child: Container(
        height: screenHeight * 0.06,
        width:  screenWidth * 0.85,
        decoration: BoxDecoration(
          color: ColorsManager.primary,
          borderRadius: BorderRadius.circular(resp * 0.04),
        ),
        child: Center(
          child: Text(
            buttonTxt,
            style: TxtStyle.size18Weight700White,
          ),
        ),
      ),
    );
  }
}