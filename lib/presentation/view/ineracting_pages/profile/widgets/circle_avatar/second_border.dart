
import 'package:flutter/material.dart';
import 'package:social_media/presentation/utils/colors/colors.dart';
import 'package:social_media/presentation/view/ineracting_pages/profile/widgets/circle_avatar/third_border.dart';

class SecondBorderCircleAvatar extends StatelessWidget {
  const SecondBorderCircleAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(70),
        border: Border.all(color: kBg, width: 5),
      ),
      child: const ThirdBorderCircleAvatar(),
    );
  }
}