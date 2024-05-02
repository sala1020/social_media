import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:social_media/data/model/post_model/post_model.dart';
import 'package:social_media/presentation/utils/colors/colors.dart';
import 'package:social_media/presentation/utils/size/heights.dart';
import 'package:social_media/presentation/utils/size/width.dart';

class Post extends StatelessWidget {
  final List<PostModel> post;
  const Post({super.key, required this.post});

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
              imagePreview(context: context, post: data);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: CachedNetworkImageProvider(data.mediaUrls.first),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<dynamic> imagePreview(
      {required BuildContext context, required PostModel post}) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog.adaptive(
          backgroundColor: Colors.black,
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min, // Adjusts size based on content
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const CircleAvatar(
                      backgroundColor: kWhite,
                    ),
                    const Text(
                      'userName',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                      ),
                    ),
                    kWidth10,
                    kWidth10,
                    kWidth10,
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.more_vert,
                        color: kWhite,
                      ),
                    ),
                  ],
                ),
                kHeight15,
                Container(
                  height: 200,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(1)),
                    image: DecorationImage(
                      image: NetworkImage(post.mediaUrls.first),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                kHeight10,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 20),
                          child: LikeButton(
                            bubblesColor: BubblesColor(
                              dotPrimaryColor: kBg,
                              dotSecondaryColor: kWhite,
                            ),
                            circleColor: CircleColor(
                              start: Colors.white,
                              end: kWhite,
                            ),
                          ),
                        ),
                        kWidth10,
                        Icon(
                          Icons.comment,
                          color: kWhite,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 40),
                          child: Text(
                            post.likesCount,
                            style: const TextStyle(
                              color: kWhite,
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
                      padding: const EdgeInsets.only(left: 15, right: 10),
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
                          fontWeight: FontWeight.w300,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
