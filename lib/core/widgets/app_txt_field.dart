import 'dart:math';

import 'package:flutter/material.dart';

import '../utils/colors_manager.dart';
import '../utils/txt_style.dart';

class AppTxtField extends StatelessWidget {
  String hintTxt;
  TextEditingController textEditingController;
  AppTxtField({super.key, required this.hintTxt, required this.textEditingController});


  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;
    double resp =min(screenHeight, screenWidth);
    return TextFormField(
      controller: textEditingController,
      decoration:InputDecoration(
        hintText: hintTxt,
        hintStyle: TxtStyle.size14Weight500hintTxtColor,
        fillColor: ColorsManager.txtFieldFillColor,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: ColorsManager.txtFieldBorderColor),
          borderRadius: BorderRadius.circular(resp * 0.04),
        ),

      ),
    );
  }
}
