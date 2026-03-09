import 'package:flutter/material.dart';

import '../../../../core/utils/colors_manager.dart';
import '../../../../core/utils/txt_style.dart';

class DocDetailCard extends StatelessWidget {
  String nameTxt;
  String specializationTxt;
  String cityTxt;
   DocDetailCard({
     super.key ,
     required this.nameTxt,
     required this.specializationTxt,
     required this.cityTxt,
   });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;
    return SizedBox(
      width: screenWidth * 0.9,
      child: Row(
          spacing: 20,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset('assets/images/home_doctor.png', width: 100, height: 100),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 7,
              children: [
                Text(nameTxt, style: TxtStyle.size18Weight700Black),
                Text("$specializationTxt | $cityTxt", style: TxtStyle.size12Weight500Grey),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    spacing: 5,
                    children: [
                      Icon(Icons.star, color: Colors.yellow,),
                      Text("4.8", style: TxtStyle.size12Weight500Grey),
                      Text("(4,279 reviews)", style: TxtStyle.size12Weight500Grey),
                      SizedBox(width: screenWidth * 0.05),
                      Icon(Icons.chat_outlined, color: ColorsManager.primary, size: screenWidth * 0.06)
                    ]
                ),
              ],
            ),
          ]
      ),
    );
  }
}
