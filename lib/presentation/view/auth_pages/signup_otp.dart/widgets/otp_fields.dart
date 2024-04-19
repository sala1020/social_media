import 'package:flutter/material.dart';
import 'package:social_media/presentation/utils/size/width.dart';
import 'package:social_media/presentation/view/auth_pages/common_widget/inputfield.dart';
import 'package:social_media/presentation/view/auth_pages/a_text_controllers/controllers.dart';

class OtpFields extends StatelessWidget {
  const OtpFields({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InputFieldAuth(
          height: 60,
          width: 60,
          textAlign: TextAlign.center,
          inputType: TextInputType.number,
          controller: Controllers.firstFieldController,
          isotp: true,
        ),
        kWidth10,
        InputFieldAuth(
          height: 60,
          width: 60,
          textAlign: TextAlign.center,
          inputType: TextInputType.number,
          controller: Controllers.secondFieldController,
          isotp: true,
        ),
        kWidth10,
        InputFieldAuth(
          height: 60,
          width: 60,
          textAlign: TextAlign.center,
          inputType: TextInputType.number,
          controller: Controllers.thirdFieldController,
          isotp: true,
        ),
        kWidth10,
        InputFieldAuth(
          height: 60,
          width: 60,
          textAlign: TextAlign.center,
          inputType: TextInputType.number,
          controller: Controllers.fourthFieldController,
          isotp: true,
        )
      ],
    );
  }
}
