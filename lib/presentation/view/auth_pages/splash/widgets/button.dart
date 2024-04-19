import 'package:flutter/material.dart';
import 'package:social_media/presentation/utils/colors/colors.dart';
import 'package:social_media/presentation/utils/fonts/fonts.dart';
import 'package:social_media/presentation/utils/functions/navigation.dart';

class SplashPageButton extends StatelessWidget {
  final String buttonName;
  final double height;
  final Widget page;
  const SplashPageButton({
    super.key,
    required this.buttonName,
    required this.height,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        kPushReplacemntNavigation(context: context, page: page);
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
