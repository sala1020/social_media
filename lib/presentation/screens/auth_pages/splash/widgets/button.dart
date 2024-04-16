import 'package:flutter/material.dart';
import 'package:social_media/presentation/core/colors/colors.dart';
import 'package:social_media/presentation/core/fonts/fonts.dart';
import 'package:social_media/presentation/screens/auth_pages/signin_page/signin_page.dart';

class SplashPageButton extends StatelessWidget {
  final String buttonName;
  final double height;
  const SplashPageButton({
    super.key,
    required this.buttonName,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const SignIn(),
        ));
      },
      child: Container(
        height: height,
        width: 255,
        decoration: BoxDecoration(
          gradient: kButtonBg,
          borderRadius: BorderRadius.circular(26),
        ),
        child: Center(
          child: Text(
            buttonName,
            style: kSplashButton,
          ),
        ),
      ),
    );
  }
}
