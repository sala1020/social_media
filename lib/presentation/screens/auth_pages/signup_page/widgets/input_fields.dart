import 'package:flutter/material.dart';
import 'package:social_media/presentation/core/size/heights.dart';
import 'package:social_media/presentation/screens/auth_pages/common_widget/button.dart';
import 'package:social_media/presentation/screens/auth_pages/common_widget/inputfield.dart';
import 'package:social_media/presentation/screens/auth_pages/otp/otp.dart';
import 'package:social_media/presentation/screens/auth_pages/signin_page/signin_page.dart';

class InputFields extends StatelessWidget {
  const InputFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 420,
      width: double.infinity,
      child: const Column(
        children: [
          InputFieldAuth(hintText: 'Name'),
          kHeight5,
          InputFieldAuth(hintText: 'Password'),
          kHeight10,
          InputFieldAuth(hintText: 'Email Address'),
          kHeight5,
          InputFieldAuth(hintText: 'Password'),
          kHeight10,
          InputFieldAuth(hintText: 'Password'),
          kHeight10,
          Button(buttonName: 'SignUp', height: 42, width: 130, page: OtpPage())
        ],
      ),
    );
  }
}
