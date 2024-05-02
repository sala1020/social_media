import 'package:flutter/material.dart';
import 'package:social_media/data/model/profile_model/profile_model.dart';
import 'package:social_media/presentation/utils/colors/colors.dart';

import 'package:social_media/presentation/view/ineracting_pages/profile/widgets/circle_avatar/circle_avatar.dart';

class ProfileSection1 extends StatelessWidget {
  final UserProfile details;
  const ProfileSection1({
    super.key,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color.fromARGB(45, 0, 0, 0),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(110),
          bottomRight: Radius.circular(80),
        ),
        border: Border(
          bottom: BorderSide(color: kBlack, width: 3),
          left: BorderSide(color: kBlack, width: 2),
        ),
      ),
      child: CircleAvatarWidget(
        details: details,
      ),
    );
  }
}
