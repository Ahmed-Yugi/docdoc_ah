import 'package:flutter/material.dart';

import '../../../../core/utils/txt_style.dart';

class DoctorSpeciality extends StatelessWidget {
  const DoctorSpeciality({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
              spacing: 6,
              children: [
                Image.asset("assets/logo/general_icon.png"),
                Text("General", style: TxtStyle.size12Weight400BMoreBlack),
              ]
          ),
          Column(
              spacing: 6,
              children: [
                Image.asset("assets/logo/neurologic_icon.png"),
                Text("Neurologic", style: TxtStyle.size12Weight400BMoreBlack),
              ]
          ),
          Column(
              spacing: 6,
              children: [
                Image.asset("assets/logo/Pediatric_icon.png"),
                Text("Pediatric", style: TxtStyle.size12Weight400BMoreBlack),
              ]
          ),
          Column(
              spacing: 6,
              children: [
                Image.asset("assets/logo/radiology_icon.png"),
                Text("Radiology", style: TxtStyle.size12Weight400BMoreBlack),
              ]
          ),
        ]
    );
  }
}
