import 'package:flutter/material.dart';

import 'package:social_media/presentation/utils/colors/colors.dart';
import 'package:social_media/presentation/utils/fonts/fonts.dart';
import 'package:social_media/presentation/utils/size/heights.dart';
import 'package:social_media/presentation/view/auth_pages/a_text_controllers/controllers.dart';
import 'package:social_media/presentation/view/auth_pages/common_widget/button.dart';
import 'package:social_media/presentation/view/auth_pages/common_widget/inputfield.dart';
import 'package:social_media/presentation/view/auth_pages/common_widget/title.dart';



class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

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
            const MainTitle(heading: "Don't Worry,\n   We've Got Your back"),
            kHeight90,
            Padding(
              padding: const EdgeInsets.only(left: 60),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Enter your email',
                    style: kInfoFont,
                  )),
            ),
            kHeight5,
            InputFieldAuth(
              hintText: 'Email Address',
              controller: Controllers.emailController,
            ),
            kHeight15,
            const Button(
                buttonName: 'Submit',
                height: 40,
                width: 100,
               )
          ],
        ),
      ),
    );
  }
}
