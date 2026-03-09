
import 'package:docdoc/features/all_recommendation_doctor/logic/cubit.dart';
import 'package:docdoc/features/all_recommendation_doctor/logic/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/txt_style.dart';
import '../../../doctor_details/presentation/screen/doctor_details_screen.dart';

class AllDoctorsWidget extends StatelessWidget {

 const  AllDoctorsWidget({super.key });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;
    return BlocBuilder<AllDoctorsCubit, AllDoctorsStates>(
     builder: (context, state) {
       if ( state is AllDoctorsLoadingState){
         return Center(child: CircularProgressIndicator());
       }else if ( state is AllDoctorsSuccessState){
         final allDoct = state.allDoctorsData.data ?? [];
         return SizedBox(
           height: screenHeight * 0.65,
           child: ListView.builder(
               padding: EdgeInsets.symmetric(vertical: screenHeight *  0.01),
               scrollDirection: Axis.vertical,
               itemCount: allDoct.length,
               itemBuilder: (context , index){
                 final doc = allDoct[index];
                 return Padding(
                   padding:  EdgeInsets.symmetric(vertical: screenHeight *  0.01),
                   child: InkWell(
                     onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => DoctorDetailsScreen(docDetailData: doc,),));
                     },
                     child: Row(
                         spacing: 20,
                         children: [
                           ClipRRect(
                             borderRadius: BorderRadius.circular(8),
                             child: Image.asset('assets/images/home_doctor.png', width: 110, height: 110),
                           ),
                           Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             spacing: 7,
                             children: [
                               Text(doc.name!, style: TxtStyle.size18Weight700Black),
                               Text("${doc.specialization!.name} | ${doc.city!.name}", style: TxtStyle.size12Weight500Grey),
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
                   ),
                 );
               }

           ),
         );
       }else if( state is AllDoctorsErrorState){
         return Center(child: Text(state.errorMassage));
       }
       return SizedBox();
      },
    );
  }
}
