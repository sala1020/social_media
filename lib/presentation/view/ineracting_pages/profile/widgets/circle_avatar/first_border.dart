import 'package:flutter/material.dart';
import 'package:social_media/data/model/profile_model/profile_model.dart';
import 'package:social_media/presentation/utils/colors/colors.dart';
import 'package:social_media/presentation/view/ineracting_pages/profile/widgets/circle_avatar/second_border.dart';

class FirstBorderCircleAvatar extends StatelessWidget {
   final UserProfile details;
  const FirstBorderCircleAvatar({
    super.key, required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(250),
        border: const Border(
          right: BorderSide(color: kBlack, width: 5),
          top: BorderSide(color: kBlack, width: 8),
        ),
      ),
      child: GestureDetector(
          onTap: () {
          },
          child:  SecondBorderCircleAvatar(details: details,)),
    );
  }
}
