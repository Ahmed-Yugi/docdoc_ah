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
      child: Stack(
        children: [
          Stack(
              alignment: Alignment.bottomRight,
              children: [
                Image.asset("assets/images/find_background.png",scale: 0.85,),
                Image.asset("assets/images/miss_doctor.png"),
              ]
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Book and \nschedule with \nnearest doctor",style: TxtStyle.size18Weight500White),
                SizedBox(height: screenHeight * 0.01,),
                Container(
                  height: screenHeight * 0.05,
                  width: screenWidth * 0.3,
                  decoration: BoxDecoration(
                    color: ColorsManager.white,
                    borderRadius: BorderRadius.circular(screenHeight * 0.04),
                  ),
                  child: Center(child: Text("Find Nearby", style: TxtStyle.size13Weight400Primary),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
