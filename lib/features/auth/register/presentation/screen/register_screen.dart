import 'dart:math';

import 'package:docdoc/core/utils/colors_manager.dart';
import 'package:docdoc/core/widgets/app_button.dart';
import 'package:docdoc/features/auth/register/data/user_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/txt_style.dart';
import '../../../../../core/widgets/app_snack_bar.dart';
import '../../../../../core/widgets/app_txt_field.dart';
import '../../../../home/presentation/screen/home_screen.dart';
import '../../../login/presentation/widgets/terms_and_privacy.dart';
import '../../logic/cubit.dart';
import '../../logic/state.dart';

class RegisterScreen  extends StatefulWidget {
   const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emilController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController genderController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

   Future toggleLang (BuildContext context)async{
     Locale currentLang = context.locale;
     if (currentLang.languageCode == "en"){
       await context.setLocale(Locale("ar"));
     }else {
       await context.setLocale(Locale("en"));

     }
   }

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
              CircleAvatar(
                radius: screenHeight * 0.032,
                backgroundColor: ColorsManager.overWhite,
                child: IconButton(icon : Icon(Icons.language, color: ColorsManager.black,size: screenHeight * 0.033),onPressed: (){
                  toggleLang(context);
                },),
              ),
              Text("Create Account".tr(), style: TxtStyle.primaryTxtStyle),
              Text(
                  "Sign up now and start exploring all that our \n app has to offer. We're excited to welcome \n you to our community!".tr(),
                  style: TxtStyle.size14Weight400Grey
              ),
              AppTxtField(hintTxt: "Name".tr(), textEditingController: nameController),
              AppTxtField(hintTxt:"Email".tr(), textEditingController: emilController),
              AppTxtField(hintTxt: "Phone Number".tr(), textEditingController: phoneController),
              AppTxtField(hintTxt: "Gender".tr(), textEditingController: genderController),
              AppTxtField(hintTxt: "Password".tr(), textEditingController: passwordController),
              AppTxtField(hintTxt: "Confirm Password".tr(), textEditingController: confirmPasswordController,),

              Center(child:
              state is RegisterLoadingState ? CircularProgressIndicator() :
              AppButton(buttonTxt: "Create Account".tr(), function: (){
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

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("By logging in , you agree to our ", style: TxtStyle.size11Weight400MoreGrey),
                    InkWell(child: Text(" Terms & Conditions ", style: TxtStyle.size11Weight400Black)),
                    Text(" and ", style: TxtStyle.size11Weight400MoreGrey),
                  ]
              ),
              Center(child: InkWell(child: Text("Privacy Policy.", style: TxtStyle.size11Weight400Black))),
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
