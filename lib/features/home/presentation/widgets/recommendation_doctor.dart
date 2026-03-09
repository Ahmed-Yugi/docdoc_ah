import 'package:docdoc/features/home/logic/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/txt_style.dart';
import '../../../doctor_details/presentation/screen/doctor_details_screen.dart';
import '../../data/home_data_model.dart';
import '../../logic/cubit.dart';

class RecommendationDoctor extends StatelessWidget {
  const RecommendationDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;
    return BlocBuilder<HomeCubit, HomeStates>(
  builder: (context, state) {

    if( state is HomeLoadingState){
      return Center(child: CircularProgressIndicator());
    }else if( state is HomeSuccessState){
      final allDocs = state.homeData
          .expand((s) => s.doctors ?? [])
          .toList();
      print(state.homeData.length);
      return SizedBox(
        height: screenHeight * 0.3,
        child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.005),
          scrollDirection: Axis.vertical,
          itemCount: allDocs.length,
          itemBuilder: (context, index) {
            final doc = allDocs[index];
            return Padding(
              padding:  EdgeInsets.symmetric(vertical: screenHeight *  0.01),
              child: Row(
                  spacing: 20,
                  children: [
                    Image.asset("assets/images/home_doctor.png"),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 7,
                      children: [
                        Text(doc.name ?? "", style: TxtStyle.size18Weight700Black),
                        Text("${doc.specialization?.name ?? ""} | ${doc.city?.name ?? ""}" , style: TxtStyle.size12Weight500Grey),
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
            );
          },
        ),
      );
    }else if( state is HomeErrorState){
      return Center(child: Text(state.errorMassage));
    }
    return SizedBox();
  },
);
  }
}
