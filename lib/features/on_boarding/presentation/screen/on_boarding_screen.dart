
import 'package:docdoc/core/utils/txt_style.dart';
import 'package:docdoc/features/on_boarding/presentation/widgets/back_ground_widget.dart';
import 'package:docdoc/core/widgets/app_button.dart';
import 'package:flutter/material.dart';
import '../../../auth/login/presentation/screen/login_screen.dart';
import '../../../auth/register/presentation/screen/register_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: Stack(
        children: [
          BackGroundWidget(),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: screenHeight * 0.09,
              ),
              Row(
                spacing: screenWidth * 0.02,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/logo/app_docdoc_logo.png", scale: 1.2,),

                ],
              ),
              SizedBox(height: screenHeight * 0.5,),
              Text("Best Doctor \nAppointment App",
              textAlign: TextAlign.center,
              style: TxtStyle.size32Weight700Blue,
              ),
              SizedBox(height: screenHeight * 0.03,),
              Text("Manage and schedule all of your medical appointments \neasily with Docdoc to get a new experience.",
                textAlign: TextAlign.center,
                style: TxtStyle.size10Weight400Grey,
              ),
              SizedBox(height: screenHeight * 0.03,),
              AppButton(buttonTxt: "Get Started", function: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
              }),
            ],
          )
        ],
      ),
    );
  }
}
