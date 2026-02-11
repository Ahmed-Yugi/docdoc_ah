import 'dart:math';

import 'package:docdoc/core/utils/colors_manager.dart';
import 'package:docdoc/core/widgets/app_button.dart';
import 'package:docdoc/features/auth/register/data/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/txt_style.dart';
import '../../../../../core/widgets/app_snack_bar.dart';
import '../../../../../core/widgets/app_txt_field.dart';
import '../../../../home/presentation/screen/home_screen.dart';
import '../../../login/presentation/widgets/terms_and_privacy.dart';
import '../../logic/cubit.dart';
import '../../logic/state.dart';

class RegisterScreen  extends StatelessWidget {
   RegisterScreen({super.key});
  TextEditingController nameController = TextEditingController();
  TextEditingController emilController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;
    return BlocProvider(
  create: (context) => RegisterCubit(),
  child: 
  BlocConsumer<RegisterCubit, RegisterStates>(
  listener: (context, state) {
    if ( state is RegisterSuccessState ){
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(userName: state.userName,)));
      AppSnackBar.show(context, message: "Account Created Successfully");
    }else if(state is RegisterErrorState){
      AppSnackBar.show(context, message: e.toString());
    }
  },
  builder: (context, state) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.09 , vertical: screenHeight * 0.07),
        child: SingleChildScrollView(
          child: Column(
            spacing: screenHeight * 0.01,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Create Account", style: TxtStyle.primaryTxtStyle),
              Text(
                  "Sign up now and start exploring all that our \n app has to offer. We're excited to welcome \n you to our community!",
                  style: TxtStyle.size14Weight400Grey
              ),
              AppTxtField(hintTxt: "Name", textEditingController: nameController),
              AppTxtField(hintTxt:"Email", textEditingController: emilController),
              AppTxtField(hintTxt: "Phone Number", textEditingController: phoneController),
              AppTxtField(hintTxt: "Gender", textEditingController: genderController),
              AppTxtField(hintTxt: "Password", textEditingController: passwordController),
              AppTxtField(hintTxt: "Confirm Password", textEditingController: confirmPasswordController,),
          
              Center(child:
              state is RegisterLoadingState ? CircularProgressIndicator() :
              AppButton(buttonTxt: "Create Account", function: (){
                context.read<RegisterCubit>().register(
                    UserModel(
                        name: nameController.text,
                        email: emilController.text,
                        phone: phoneController.text,
                        gender: genderController.text,
                        password: passwordController.text,
                        passwordConfirmation: confirmPasswordController.text
                    ));
          
              })),
              SizedBox(height: screenHeight * 0.05,),
              TermsAndPrivacy(),
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
