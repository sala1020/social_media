import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_media/data/model/profile_model/profile_model.dart';

class ThirdBorderCircleAvatar extends StatelessWidget {
  final UserProfile details;
  const ThirdBorderCircleAvatar({
    super.key,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(250),
        border: const Border(
          left: BorderSide(color: CupertinoColors.black, width: 5),
          bottom: BorderSide(color: CupertinoColors.black, width: 8),
        ),
      ),
      child: CircleAvatar(
        radius: 60,
        child: ClipOval(
            child: details.userProfileImageUrl.isEmpty
                ? Image.asset(
                    'assets/profile1.png',
                    fit: BoxFit.cover,
                  )
                : CachedNetworkImage(imageUrl: details.userProfileImageUrl)),
      ),
    );
  }
}
