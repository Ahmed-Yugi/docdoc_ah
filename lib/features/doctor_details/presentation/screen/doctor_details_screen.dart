import 'package:docdoc/core/widgets/app_button.dart';
import 'package:docdoc/features/all_recommendation_doctor/data/all_doctors_data_model.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/colors_manager.dart';
import '../../../../core/utils/txt_style.dart';
import '../../../appointment_date/presentation/Screen/appointment_date.dart';
import '../widgets/doc_detail_card.dart';

class DoctorDetailsScreen extends StatelessWidget {
  Data docDetailData;

   DoctorDetailsScreen({super.key , required this.docDetailData});

  @override
  Widget build(BuildContext context) {
    final docDetail = docDetailData;
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.09, vertical: screenHeight * 0.07),
        child: Column(
          spacing: screenHeight * 0.02,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
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
                    docDetail.name!,
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
            DocDetailCard(
              nameTxt: "${docDetail.name}",
              specializationTxt: "${docDetail.specialization!.name}",
              cityTxt: "${docDetail.city!.name}"
            ),
            SizedBox(height: screenHeight * 0.01,),
            // About Bar
            DefaultTabController(
              length: 3,
              child: Column(
                children: [
                  TabBar(
                    labelColor: ColorsManager.primary,
                    unselectedLabelColor: ColorsManager.grey,
                    indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(
                        width: 3,
                        color: ColorsManager.primary,
                      ),
                      insets: EdgeInsets.symmetric(horizontal: screenWidth * 0.17 ),
                    ),
                    indicatorColor: ColorsManager.primary,
                    tabs: [
                      Tab(text: "About"),
                      Tab(text: "Location"),
                      Tab(text: "Reviews"),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.47,
                    child: TabBarView(
                      children: [
                        // About
                        Padding(
                          padding: EdgeInsets.all(16),
                          child: SingleChildScrollView(
                            child: Column(
                              spacing: screenHeight * 0.02,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              Text("About me", style: TxtStyle.size18Weight700Black),
                              Text(docDetail.description!, style: TxtStyle.size14Weight400Grey),
                              Text("Working Time", style: TxtStyle.size18Weight700Black),
                              Text("${docDetail.startTime!} - ${docDetail.endTime!}", style: TxtStyle.size14Weight400Grey),
                              Text("Phone", style: TxtStyle.size18Weight700Black),
                              Text(docDetail.phone.toString(), style: TxtStyle.size14Weight400Grey),
                              Text("E-Mail", style: TxtStyle.size18Weight700Black),
                              Text(docDetail.email!, style: TxtStyle.size14Weight400Grey),
                              Text("Address", style: TxtStyle.size18Weight700Black),
                              Text(docDetail.address!, style: TxtStyle.size14Weight400Grey),
                              Text("City", style: TxtStyle.size18Weight700Black),
                              Text(docDetail.city.toString(), style: TxtStyle.size14Weight400Grey),
                              Text("Price", style: TxtStyle.size18Weight700Black),
                              Text(docDetail.appointPrice.toString(), style: TxtStyle.size14Weight400Grey),
                             ]
                            ),
                          ),
                        ),

                        // Location
                        Center(child: Text("Location")),

                        // Reviews
                        Center(child: Text("Reviews")),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            AppButton(buttonTxt: "Make An Appointment", function: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AppointmentDate(),));
            }),
          ],
        ),
      ),
    );
  }
}
