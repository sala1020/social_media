import 'package:flutter/material.dart';
import 'package:social_media/presentation/core/colors/colors.dart';
import 'package:social_media/presentation/core/fonts/fonts.dart';
import 'package:social_media/presentation/screens/auth_pages/signin_page/signin_page.dart';

class Button extends StatelessWidget {
  final String buttonName;
  final double height;
  final double width;
  final Widget page;
  const Button(
      {super.key,
      required this.buttonName,
      required this.height,
      required this.width, required this.page});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => page,
        ));
      },
      child: Container(
        height: height,
        width: width,
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
