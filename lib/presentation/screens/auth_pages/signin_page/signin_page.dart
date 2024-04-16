import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:social_media/presentation/core/colors/colors.dart';
import 'package:social_media/presentation/screens/auth_pages/signin_page/widgets/header.dart';
import 'package:social_media/presentation/screens/auth_pages/common_widget/suggestion.dart';
import 'package:social_media/presentation/screens/auth_pages/signin_page/widgets/section2.dart';
import 'package:social_media/presentation/screens/auth_pages/common_widget/suggestions.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(gradient: bg),
        child: Animate(
          effects: [
            FadeEffect(
              duration: 1000.ms,
            ),
            FadeEffect(
              duration: 1000.ms,
            )
          ],
          child: const SingleChildScrollView(
            child: Column(
              children: [
                SectionSignIn1(),
                SectionSignIn2(),
                Suggestions(
                  tailText: 'SignIn',
                  mainText: "Don't have an account?",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
