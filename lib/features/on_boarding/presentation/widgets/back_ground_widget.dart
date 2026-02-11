import 'package:flutter/material.dart';

class BackGroundWidget extends StatelessWidget {
  const BackGroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    final double screenWidth = MediaQuery.sizeOf(context).width;
    return Center(
      child: SizedBox(
        height: screenHeight,
        width: screenWidth,
        child: Center(
          child: Stack(
           children: [
             Image.asset("assets/images/water_mark_logo_1.png"),
             Image.asset("assets/images/water_mark_logo_2.png"),
             Image.asset("assets/images/water_mark_logo_3.png"),
             Image.asset("assets/images/doctor_image.png"),
             Positioned.fill(
               child: IgnorePointer(
                 child: DecoratedBox(
                   decoration: BoxDecoration(
                     gradient: LinearGradient(
                       begin: Alignment.bottomCenter,
                       end: Alignment.topCenter,
                       colors: [
                         Colors.white.withOpacity(0.9),
                         Colors.transparent,
                       ],
                       stops: const [0.2, 0.6],
                     ),
                   ),
                 ),
               ),
             ),
           ],
          ),
        ),
      ),
    );
  }
}
