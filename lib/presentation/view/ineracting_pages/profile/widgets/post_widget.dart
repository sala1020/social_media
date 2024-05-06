import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:social_media/data/model/post_model/post_model.dart';
import 'package:social_media/data/model/profile_model/profile_model.dart';
import 'package:social_media/presentation/utils/colors/colors.dart';
import 'package:social_media/presentation/utils/size/heights.dart';
import 'package:social_media/presentation/utils/size/width.dart';
import 'package:social_media/presentation/view/ineracting_pages/profile/widgets/image_overview.dart';

class Post extends StatelessWidget {
  final List<PostModel> post;
  final UserProfile profile;
   Post({super.key, required this.post, required this.profile});
    final GlobalKey popover=GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: GridView.builder(
        itemCount: post.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
          crossAxisCount: 3,
          childAspectRatio: 19 / 19,
        ),
        itemBuilder: (context, index) {
          var data = post[index];
          return GestureDetector(
            onTap: () {
              imagePreview(context: context, post: data,profile: profile,popOverKey: popover);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: data.mediaUrls.first,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
