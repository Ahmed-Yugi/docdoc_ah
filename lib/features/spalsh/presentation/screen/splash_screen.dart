import 'package:flutter/material.dart';

import '../../../on_boarding/presentation/screen/on_boarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OnBoardingScreen(),));
    });
  }
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Image.asset("assets/images/water_mark_logo_1.png"),
            Image.asset("assets/images/water_mark_logo_2.png"),
            Image.asset("assets/images/water_mark_logo_3.png"),
            SizedBox(
              height: screenHeight * 0.5,
              child: Row(
                spacing: 20,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/logo/app_docdoc_logo.png",),

                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}
