import 'package:flutter/material.dart';
import 'package:social_media/presentation/core/fonts/fonts.dart';

class Section1 extends StatelessWidget {
  const Section1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      height: 360,
      width: double.infinity,
      child: Text(
        'BunnYBuzZ',
        style: kTitleFont,
      ),
    );
  }
}