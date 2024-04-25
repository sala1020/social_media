import 'package:flutter/material.dart';
import 'package:social_media/presentation/utils/colors/colors.dart';

class ThirdBorderCircleAvatar extends StatelessWidget {
  const ThirdBorderCircleAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(70),
        border: const Border(
          left: BorderSide(color: kBlack, width: 5),
          bottom: BorderSide(color: kBlack, width: 8),
        ),
      
      ),
      child: CircleAvatar(
        radius: 60,
        child: ClipOval(
          child: Image.asset(
            'assets/profile1.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
