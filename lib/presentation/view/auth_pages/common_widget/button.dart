import 'package:flutter/material.dart';
import 'package:social_media/presentation/utils/colors/colors.dart';
import 'package:social_media/presentation/utils/fonts/fonts.dart';

class Button extends StatelessWidget {
  final String buttonName;
  final double height;
  final double width;
  final GlobalKey<FormState>? formkey;

  final void Function()? ontap;
  const Button(
      {super.key,
      required this.buttonName,
      required this.height,
      required this.width,
      this.formkey,
    
      this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: kBlack,
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
