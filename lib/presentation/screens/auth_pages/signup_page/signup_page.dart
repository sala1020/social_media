import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:social_media/presentation/core/colors/colors.dart';
import 'package:social_media/presentation/screens/auth_pages/signin_page/widgets/header.dart';
import 'package:social_media/presentation/screens/auth_pages/common_widget/heading.dart';
import 'package:social_media/presentation/screens/auth_pages/common_widget/suggestions.dart';
import 'package:social_media/presentation/screens/auth_pages/signup_page/widgets/input_fields.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(gradient: bg),
        width: double.infinity,
        height: double.infinity,
        child: const SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 250,
                width: double.infinity,
                child: Heading(
                    heading: 'Bunny\nWelcomes You', imageUrl: 'assets/og.png'),
              ),
              InputFields(),
              Suggestions(
                tailText: 'SignIn',
                mainText: "Already have an account?",
              )
            ],
          ),
        ),
      ),
    );
  }
}
