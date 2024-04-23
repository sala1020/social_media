import 'package:flutter/material.dart';
import 'package:social_media/presentation/utils/size/width.dart';
import 'package:social_media/presentation/view/auth_pages/common_widget/inputfield.dart';
import 'package:social_media/presentation/view/auth_pages/a_text_controllers/controllers.dart';
import 'package:social_media/presentation/view/auth_pages/common_widget/otp_field.dart';

class OtpFields extends StatelessWidget {
  const OtpFields({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Create a single FocusNode instance to manage focus for all fields
    final FocusNode focusNode = FocusNode();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OtpField(
          controller: Controllers.firstFieldController,

        ),
        kWidth10,
        OtpField(
          controller: Controllers.secondFieldController,

        ),
        kWidth10,
        OtpField(
          controller: Controllers.thirdFieldController,

        ),
        kWidth10,
        OtpField(
          controller: Controllers.fourthFieldController,

        )
      ],
    );
  }
}
