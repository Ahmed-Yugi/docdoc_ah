import 'package:flutter/material.dart';

import '../../../../../core/utils/colors_manager.dart';
import '../../../../../core/utils/txt_style.dart';

class Password extends StatelessWidget {
  final bool value;
  final Function(bool?) onChanged;

  const Password({
    super.key ,
    required this.value,
    required this.onChanged
  });

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.sizeOf(context).width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Checkbox(
              value: value,
              onChanged: onChanged,
              checkColor: ColorsManager.white,
              activeColor: ColorsManager.primary,

            ),

            Text("Remember me", style: TxtStyle.size12Weight400moreGrey),
          ],
        ),
        Text("Forgot Password?", style: TxtStyle.size12Weight400Primary),
      ],
    );
  }
}
