import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/txt_style.dart';
import '../../logic/cubit.dart';
import '../../logic/states.dart';

class DoctorSpeciality extends StatelessWidget {
  const DoctorSpeciality({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
         if( state is HomeLoadingState){
            return Center(child: CircularProgressIndicator());
         }else if( state is HomeSuccessState){
            return SizedBox(
         height: screenHeight * 0.1,
         child: ListView.builder(itemBuilder: (BuildContext context, int index) {
           return Padding(
             padding:  EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
             child: Column(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 spacing: 6,
                 children: [
                   Image.asset("assets/logo/general_icon.png"),
                   Text(state.homeData[index].name!, style: TxtStyle.size12Weight400BMoreBlack),
                 ]
             ),
           );
         },
           itemCount: state.homeData.length,
           scrollDirection: Axis.horizontal,
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
