import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_media/data/model/profile_model/profile_model.dart';
import 'package:social_media/presentation/utils/fonts/fonts.dart';
import 'package:social_media/presentation/utils/size/width.dart';
import 'package:social_media/presentation/view/ineracting_pages/profile/widgets/counts.dart';
import 'package:social_media/presentation/view/ineracting_pages/profile/widgets/circle_avatar/first_border.dart';
import 'package:social_media/presentation/view/ineracting_pages/profile/widgets/icon.dart';

class CircleAvatarWidget extends StatelessWidget {
  final UserProfile details;
  const CircleAvatarWidget({
    super.key,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FirstBorderCircleAvatar(
                  details: details,
                ),
              ),
            ),
            Counts(
              heading: "Post",
              count: details.postsCount.toString(),
            ),
            kWidth10,
            Counts(
              heading: "Followers",
              count: details.followersCount.toString(),
            ),
            kWidth10,
            Counts(
              heading: "Following",
              count: details.followingCount.toString(),
            ),
          ],
        ),
        Positioned(
            left: 155,
            top: 55,
            child: Text(
              details.name,
              style: kProfileName,
            )),
        const IconMore(),
      ],
    );
  }
}
