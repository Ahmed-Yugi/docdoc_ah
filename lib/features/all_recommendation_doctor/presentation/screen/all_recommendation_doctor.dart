import 'package:docdoc/core/utils/colors_manager.dart';
import 'package:docdoc/features/all_recommendation_doctor/logic/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/txt_style.dart';
import '../widgets/all_doctors_widget.dart';
import '../widgets/search_txt_field.dart';

class AllRecommendationDoctor extends StatefulWidget {

  AllRecommendationDoctor({super.key});

  @override
  State<AllRecommendationDoctor> createState() => _AllRecommendationDoctorState();
}

class _AllRecommendationDoctorState extends State<AllRecommendationDoctor> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;
    return BlocProvider(
    create: (context) => AllDoctorsCubit() .. getAllDoctorsData(),

  child: Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: screenWidth * 0.07, vertical: screenHeight * 0.07),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            SizedBox(
            height: screenHeight * 0.07,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: ColorsManager.white,
                    borderRadius: BorderRadius.circular(screenWidth * 0.03),
                    border: Border.all(color: ColorsManager.txtFieldBorderColor),
                  ),
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      size: screenWidth * 0.045,
                      color: ColorsManager.black,
                    ),
                  ),
                ),
          
                Text(
                  "Recommendation Doctor",
                  style: TxtStyle.size18Weight700Black,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: ColorsManager.white,
                    borderRadius: BorderRadius.circular(screenWidth * 0.03),
                    border: Border.all(color: ColorsManager.txtFieldBorderColor),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.more_horiz,
                      size: screenWidth * 0.05,
                      color: ColorsManager.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
              SizedBox(height: screenHeight * 0.02,),
              SearchTxtField(hintTxt: "Search Doctor",),
              SizedBox(height: screenHeight * 0.02,),
              AllDoctorsWidget(),
            ],
          ),
        ),
      ),
    ),
);
  }
}
