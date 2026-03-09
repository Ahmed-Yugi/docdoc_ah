import 'dart:math';
import 'package:docdoc/features/all_recommendation_doctor/logic/cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/colors_manager.dart';
import '../../../../core/utils/txt_style.dart';

class SearchTxtField extends StatelessWidget {
  String hintTxt;
  SearchTxtField({super.key, required this.hintTxt, });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;
    double resp =min(screenHeight, screenWidth);
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            onChanged: (value) {
              context.read<AllDoctorsCubit>().searchDoctors(value);
            },
            decoration: InputDecoration(
              hintText: hintTxt,
              hintStyle: TxtStyle.size14Weight500hintTxtColor,
              prefixIcon: Icon(Icons.search, color: ColorsManager.grey),
              fillColor: ColorsManager.overWhite,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(resp * 0.04),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),

        SizedBox(width: resp * 0.03),

        Icon(
          Icons.filter_list,
          color: ColorsManager.black,
        ),
      ],
    );
  }
}
