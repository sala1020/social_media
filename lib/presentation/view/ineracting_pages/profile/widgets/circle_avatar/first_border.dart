import 'package:flutter/material.dart';
import 'package:social_media/presentation/utils/colors/colors.dart';
import 'package:social_media/presentation/view/ineracting_pages/profile/widgets/circle_avatar/second_border.dart';

class FirstBorderCircleAvatar extends StatelessWidget {
  const FirstBorderCircleAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(70),
        border: const Border(
          right: BorderSide(color: kBlack, width: 5),
          top: BorderSide(color: kBlack, width: 8),
        ),
      ),
      child: GestureDetector(
          onTap: () {
            print('tapped');
          },
          child: const SecondBorderCircleAvatar()),
    );
  }
}
