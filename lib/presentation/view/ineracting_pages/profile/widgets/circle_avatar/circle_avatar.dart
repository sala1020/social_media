import 'package:flutter/material.dart';
import 'package:social_media/presentation/utils/size/width.dart';
import 'package:social_media/presentation/view/ineracting_pages/profile/widgets/counts.dart';
import 'package:social_media/presentation/view/ineracting_pages/profile/widgets/circle_avatar/first_border.dart';
import 'package:social_media/presentation/view/ineracting_pages/profile/widgets/icon.dart';

class CircleAvatarWidget extends StatelessWidget {
  const CircleAvatarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: FirstBorderCircleAvatar(),
              ),
            ),
            Counts(
              heading: "Post",
              count: "0",
            ),
            kWidth10,
            Counts(
              heading: "Followers",
              count: "0",
            ),
            kWidth10,
            Counts(
              heading: "Following",
              count: "0",
            ),
          ],
        ),
        IconMore(),
      ],
    );
  }
}
