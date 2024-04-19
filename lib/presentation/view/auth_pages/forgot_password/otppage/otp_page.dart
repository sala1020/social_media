import 'package:flutter/material.dart';
import 'package:social_media/presentation/utils/colors/colors.dart';
import 'package:social_media/presentation/utils/fonts/fonts.dart';
import 'package:social_media/presentation/utils/size/heights.dart';
import 'package:social_media/presentation/view/auth_pages/common_widget/button.dart';
import 'package:social_media/presentation/view/auth_pages/common_widget/title.dart';
import 'package:social_media/presentation/view/auth_pages/signup_otp.dart/widgets/otp_fields.dart';

class ResetOtpPage extends StatelessWidget {
  const ResetOtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: bg),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          const MainTitle(heading: 'OTP Verification'),
          kHeight90,
          Text('We have sent you a verification code to\nyour email address',
              style: kInfoFont),
          kHeight15,
          const OtpFields(),
          kHeight30,
          const Button(
              buttonName: 'Submit', height: 42, width: 150, )
        ]),
      ),
    );
  }
}
