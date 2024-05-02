
import 'package:flutter/material.dart';
import 'package:social_media/presentation/utils/colors/colors.dart';

class NormalButton extends StatelessWidget {
  final void Function()? onTap;
  final String buttonName;
  final double height;
  final double width;
  const NormalButton({
    super.key,
    this.onTap,
    required this.buttonName,
    this.height = 50,
    this.width = 150,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: kBlack,
        ),
        child: Center(
          child: Text(
            buttonName,
            style: const TextStyle(color: kWhite, fontSize: 20),
          ),
        ),
      ),
    );
  }
}

class ProfileButtons extends StatelessWidget {
  const ProfileButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        NormalButton(
          buttonName: 'Edit Profile',
        ),
        NormalButton(
          buttonName: 'Edit Bio',
        ),
      ],
    );
  }
}
