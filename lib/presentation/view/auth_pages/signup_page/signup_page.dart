import 'package:flutter/material.dart';

import 'package:social_media/presentation/utils/colors/colors.dart';
import 'package:social_media/presentation/utils/size/heights.dart';

import 'package:social_media/presentation/view/auth_pages/common_widget/heading.dart';
import 'package:social_media/presentation/view/auth_pages/common_widget/suggestions.dart';
import 'package:social_media/presentation/view/auth_pages/signin_page/signin_page.dart';
import 'package:social_media/presentation/view/auth_pages/signup_page/widgets/input_fields.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(color: kBg),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 220,
                width: double.infinity,
                child: Align(
                  child: Heading(heading: 'Bunny\nWelcomes You'),
                ),
              ),
              kHeight10,
              InputFields(),
              kHeight10,
              const Suggestions(
                tailText: 'SignIn',
                mainText: "Already have an account?",
                page: SignIn(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
