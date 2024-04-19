import 'package:flutter/material.dart';
import 'package:social_media/presentation/utils/colors/colors.dart';
import 'package:social_media/presentation/utils/size/heights.dart';
import 'package:social_media/presentation/view/auth_pages/a_text_controllers/controllers.dart';
import 'package:social_media/presentation/view/auth_pages/common_widget/button.dart';
import 'package:social_media/presentation/view/auth_pages/common_widget/inputfield.dart';
import 'package:social_media/presentation/view/auth_pages/common_widget/title.dart';


class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

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
            const MainTitle(heading: 'Reset your password'),
            kHeight90,
            InputFieldAuth(
              hintText: 'New Password',
              controller: Controllers.passwordController,
            ),
            kHeight15,
            InputFieldAuth(
              hintText: 'Confirm Password',
              controller: Controllers.newpasswordController,
            ),
          kHeight15,
            const Button(buttonName: 'Reset', height: 40, width: 100,)
          ],
        ),
      ),
    );
  }
}
