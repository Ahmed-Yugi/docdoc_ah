import 'package:flutter/material.dart';

import '../../../../core/utils/colors_manager.dart';
import '../../../../core/utils/txt_style.dart';

class NearbyWidget extends StatelessWidget {
  const NearbyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;
    return SizedBox(
      height: screenHeight * 0.25 ,
      width: screenWidth * 0.9,
      child: Image.asset("assets/images/banner.png"),
    );
  }
}
