import 'package:flutter/material.dart';

class SignInApps extends StatefulWidget {
  const SignInApps({super.key});

  @override
  State<SignInApps> createState() => _SignInAppsState();
}

class _SignInAppsState extends State<SignInApps> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;
    return SizedBox(
      height: screenHeight * 0.05,
      width: screenWidth * 0.85,
      child: Row(
        spacing: screenWidth * 0.1,

        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/logo/google_logo.png"),
          Image.asset("assets/logo/facebook_logo.png"),
          Image.asset("assets/logo/apple_logo.png"),
        ]
      ),
    );
  }
}
