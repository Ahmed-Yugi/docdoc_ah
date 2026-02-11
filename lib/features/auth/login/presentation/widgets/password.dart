import 'package:flutter/material.dart';

import '../../../../../core/utils/colors_manager.dart';
import '../../../../../core/utils/txt_style.dart';

class Password extends StatelessWidget {
  const Password({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(Icons.check_box_outline_blank, color: ColorsManager.moreGrey),
        SizedBox(width: screenWidth * 0.02,),
        Text("Remember me", style: TxtStyle.size12Weight400moreGrey),
        Spacer(),
        Text("Forgot Password?", style: TxtStyle.size12Weight400Primary),
      ],
    );
  }
}
