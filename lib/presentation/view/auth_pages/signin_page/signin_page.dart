import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:social_media/presentation/utils/colors/colors.dart';
import 'package:social_media/presentation/view/auth_pages/signin_page/widgets/header.dart';

import 'package:social_media/presentation/view/auth_pages/signin_page/widgets/section2.dart';
import 'package:social_media/presentation/view/auth_pages/common_widget/suggestions.dart';
import 'package:social_media/presentation/view/auth_pages/signup_page/signup_page.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(color: kBg),
        child: Animate(
          effects: [
            FadeEffect(
              duration: 1000.ms,
            ),
            FadeEffect(
              duration: 1000.ms,
            )
          ],
          child:  SingleChildScrollView(
            child: Column(
              children: [
                const SectionSignIn1(),
                SectionSignIn2(),
                const Suggestions(
                  tailText: 'SignUp',
                  mainText: "Don't have an account?",
                  page: SignUpPage(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
