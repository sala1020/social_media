import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/data/model/post_model/post_model.dart';
import 'package:social_media/data/model/profile_model/profile_model.dart';
import 'package:social_media/presentation/utils/colors/colors.dart';
import 'package:social_media/presentation/utils/size/heights.dart';
import 'package:social_media/presentation/utils/size/width.dart';
import 'package:social_media/presentation/view/ineracting_pages/profile/bloc/profile_bloc.dart';
import 'package:social_media/presentation/view/ineracting_pages/profile/widgets/image_overvew/top_section.dart';

Future<dynamic> imagePreview(
    {required BuildContext context,
    required PostModel post,
    required UserProfile profile,
    required GlobalKey popOverKey}) {
  return showDialog(
    context: context,
    builder: (context) {
      return SafeArea(
        child: AlertDialog.adaptive(
          backgroundColor: Colors.black,
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min, // Adjusts size based on content
              children: [
                TopSection(
                  post: post,
                  profile: profile,
                ),
                kHeight15,
                Container(
                  height: 200,
                  width: 250,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(1)),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl: post.mediaUrls.first,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                kHeight10,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        BlocBuilder<ProfileBloc, ProfileState>(
                          builder: (context, state) {
                            bool? isliked;
                            return Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 20),
                              child: IconButton(
                                onPressed: () {
                                  context.read<ProfileBloc>().add(
                                      LikedPostEvent(
                                          postID: post.postId.toString()));
                                },
                                icon: Icon(
                                  Icons.favorite,
                                  color: post.likeStatus ? kWhite : kGrey,
                                  size: 30,
                                ),
                              ),
                            );
                          },
                        ),
                        kWidth10,
                        const Icon(
                          Icons.comment,
                          color: kWhite,
                        ),
                      ],
                    ),
                    if (post.likesCount.isNotEmpty ||
                        post.commentsCount.isNotEmpty)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 40),
                            child: Text(
                              post.likesCount,
                              style: const TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          kWidth10,
                          Text(
                            post.commentsCount,
                            style: const TextStyle(
                              color: kWhite,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 10),
                      child: Text(
                        post.caption,
                        style: const TextStyle(
                          color: kWhite,
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                        right: 10,
                        top: 5,
                        bottom: 10,
                      ),
                      child: Text(
                        post.postAge,
                        style: const TextStyle(
                          color: kGrey,
                          fontWeight: FontWeight.w500,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
// if (state is LikedPostState) {
                                  //   isliked = state.isLiked;
                                  // }
                                  // return LikeButton(
                                  //   likeBuilder: (isLiked) {},
                                  //   isLiked: isliked ?? post.likeStatus,
                                  //   bubblesColor: const BubblesColor(
                                  //     dotPrimaryColor: kBg,
                                  //     dotSecondaryColor: kWhite,
                                  //   ),
                                  //   circleColor: const CircleColor(
                                  //     start: Colors.white,
                                  //     end: kWhite,
                                  //   ),
                                  // );