import 'package:flutter/material.dart';

import '../../../../core/utils/txt_style.dart';

class AppointmentDate extends StatelessWidget {
  const AppointmentDate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Appointment Date" , style: TxtStyle.primaryTxtStyle,)),
    );
  }
}
