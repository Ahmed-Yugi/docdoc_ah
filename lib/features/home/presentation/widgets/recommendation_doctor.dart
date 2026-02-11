import 'package:flutter/material.dart';

import '../../../../core/utils/txt_style.dart';

class RecommendationDoctor extends StatelessWidget {
  const RecommendationDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;
    return SizedBox(
      height: screenHeight * 0.22,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.005),
        scrollDirection: Axis.vertical,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Padding(
            padding:  EdgeInsets.symmetric(vertical: screenHeight *  0.01),
            child: Row(
                spacing: 20,
                children: [
                  Image.asset("assets/images/home_doctor.png"),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 7,
                    children: [
                      Text("Dr. Randy Wigham", style: TxtStyle.size18Weight700Black),
                      Text("General | RSUD Gatot Subroto", style: TxtStyle.size12Weight500Grey),
                      Row(
                          spacing: 5,
                          children: [
                            Icon(Icons.star, color: Colors.yellow,),
                            Text("4.8", style: TxtStyle.size12Weight500Grey),
                            Text("(4,279 reviews)", style: TxtStyle.size12Weight500Grey),
                          ]
                      ),
                    ],
                  ),
                ]
            ),
          );
        },
      ),
    );
  }
}
