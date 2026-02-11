import 'package:flutter/material.dart';

import '../../../../../core/utils/txt_style.dart';

class TermsAndPrivacy extends StatefulWidget {
  const TermsAndPrivacy({super.key});

  @override
  State<TermsAndPrivacy> createState() => _TermsAndPrivacyState();
}

class _TermsAndPrivacyState extends State<TermsAndPrivacy> {
  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("By  logging  in , you  agree  to  our ", style: TxtStyle.size11Weight400MoreGrey),
            InkWell(child: Text(" Terms & Conditions ", style: TxtStyle.size11Weight400Black)),
            Text(" and ", style: TxtStyle.size11Weight400MoreGrey),
          ]
        ),
        InkWell(child: Text("Privacy Policy.", style: TxtStyle.size11Weight400Black)),
      ],
    );
  }
}
