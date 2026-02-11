import 'dart:math';

import 'package:docdoc/core/utils/colors_manager.dart';
import 'package:docdoc/core/widgets/app_button.dart';
import 'package:docdoc/features/auth/login/presentation/widgets/password.dart';
import 'package:docdoc/features/auth/register/data/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/txt_style.dart';
import '../../../../../core/widgets/app_snack_bar.dart';
import '../../../../../core/widgets/app_txt_field.dart';
import '../../../../home/presentation/screen/home_screen.dart';
import '../../data/user_model.dart';
import '../../logic/cubit.dart';
import '../../logic/state.dart';
import '../widgets/register_text.dart';
import '../widgets/sign_in_apps.dart';
import '../widgets/terms_and_privacy.dart';

class LoginScreen  extends StatefulWidget {
  LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emilController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;
    return BlocProvider(
      create: (context) => LoginCubit(),
      child:
      BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if ( state is LoginSuccessState ){
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(userName: state.userName,),));
            AppSnackBar.show(context, message: "Login Successfully");
          }else if(state is LoginErrorState){
            AppSnackBar.show(context, message: e.toString());
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1 , vertical: screenHeight * 0.07),
              child: SingleChildScrollView(
                child: Column(
                  spacing: screenHeight * 0.025,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text("Welcome Back", style: TxtStyle.primaryTxtStyle),
                    Text(
                        "We're excited to have you back, can't wait to \nsee what you've been up to since you last \nlogged in.",
                        style: TxtStyle.size14Weight400Grey
                    ),
                    SizedBox(height: screenHeight * 0.009,),
                    AppTxtField(hintTxt:"Email", textEditingController: emilController),
                    AppTxtField(hintTxt: "Password", textEditingController: passwordController),
                    Password(),
                    SizedBox(height: screenHeight * 0.005,),
                    Center(child:
                    state is LoginLoadingState ? CircularProgressIndicator() :
                    AppButton(buttonTxt: "Login", function: (){
                      context.read<LoginCubit>().login(
                          UserLoginModel(
                              email: emilController.text,
                              password: passwordController.text,
                          ));
                    })),
                    SizedBox(height: screenHeight * 0.003,),
                    Center(child: Text(" ــــــــــــــــــــــــــــ Or sign in with ـــــــــــــــــــــــــــــ", style: TxtStyle.size12Weight400moreGrey)),
                    SizedBox(height: screenHeight * 0.003,),
                    SignInApps(),
                    TermsAndPrivacy(),
                    RegisterText(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}