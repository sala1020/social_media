
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:social_media/data/model/post_model/post_model.dart';
import 'package:social_media/data/model/profile_model/profile_model.dart';
import 'package:social_media/presentation/utils/colors/colors.dart';
import 'package:social_media/presentation/utils/size/width.dart';
import 'package:social_media/presentation/view/ineracting_pages/profile/widgets/image_overvew/delete_button.dart';

class TopSection extends StatelessWidget {
  final UserProfile profile;
  final PostModel post;
  const TopSection({
    super.key,
    required this.profile,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: kWhite,
              child: profile.userProfileImageUrl.isNotEmpty
                  ? CachedNetworkImage(
                      imageUrl: profile.userProfileImageUrl,
                      fit: BoxFit.cover,
                    )
                  : ClipOval(child: Image.asset('assets/profile1.png')),
            ),
            kWidth10,
            Text(
              profile.username,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 15,
              ),
            ),
          ],
        ),
        kWidth10,
        kWidth10,
        kWidth10,
        IconButton(
          onPressed: () {
            DeleteButtonWidget(context, post);
          },
          icon: const Icon(
            Icons.more_vert,
            color: kWhite,
          ),
        ),
      ],
    );
  }
}
