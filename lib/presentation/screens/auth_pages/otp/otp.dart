import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_media/presentation/core/colors/colors.dart';
import 'package:social_media/presentation/core/size/heights.dart';
import 'package:social_media/presentation/core/size/width.dart';
import 'package:social_media/presentation/screens/auth_pages/common_widget/button.dart';
import 'package:social_media/presentation/screens/auth_pages/common_widget/inputfield.dart';
import 'package:social_media/presentation/screens/auth_pages/common_widget/title.dart';
import 'package:social_media/presentation/screens/auth_pages/signup_page/signup_page.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

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
            Text(
              'We have sent you a verification code to\nyour email address',
              style: GoogleFonts.josefinSans(
                fontSize: 18,
                color: kWhite,
              ),
            ),
            kHeight15,
            OtpFields(),
            kHeight30,
            Button(
                buttonName: 'Submit',
                height: 42,
                width: 150,
                page: SignUpPage())
          ],
        ),
      ),
    );
  }
}

class OtpFields extends StatelessWidget {
  const OtpFields({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InputFieldAuth(
          height: 60,
          width: 60,
          textAlign: TextAlign.center,
          inputType: TextInputType.number,
        ),
        kWidth10,
        InputFieldAuth(
          height: 60,
          width: 60,
          textAlign: TextAlign.center,
          inputType: TextInputType.number,
        ),
        kWidth10,
        InputFieldAuth(
          height: 60,
          width: 60,
          textAlign: TextAlign.center,
          inputType: TextInputType.number,
        ),
        kWidth10,
        InputFieldAuth(
          height: 60,
          width: 60,
          textAlign: TextAlign.center,
          inputType: TextInputType.number,
        )
      ],
    );
  }
}
