import 'package:docdoc/features/auth/register/presentation/screen/register_screen.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/txt_style.dart';

class RegisterText extends StatefulWidget {
  const RegisterText({super.key});

  @override
  State<RegisterText> createState() => _RegisterTextState();
}

class _RegisterTextState extends State<RegisterText> {
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Don't have any account yet? ", style: TxtStyle.size11Weight400Black),
          InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen(),));
              },
              child: Text("Sign Up ", style: TxtStyle.size11Weight400Primary)),
        ]
    );
  }
}
