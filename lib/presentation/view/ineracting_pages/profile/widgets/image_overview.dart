import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:like_button/like_button.dart';
import 'package:popover/popover.dart';
import 'package:social_media/data/model/post_model/post_model.dart';
import 'package:social_media/data/model/profile_model/profile_model.dart';
import 'package:social_media/presentation/utils/colors/colors.dart';
import 'package:social_media/presentation/utils/size/heights.dart';
import 'package:social_media/presentation/utils/size/width.dart';
import 'package:social_media/presentation/view/ineracting_pages/profile/widgets/pop_over_item.dart';

Future<dynamic> imagePreview(
    {required BuildContext context,
    required PostModel post,
    required UserProfile profile,
    required GlobalKey popOverKey}) {
  print(post.likesCount);

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
                Row(
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
                              : ClipOval(
                                  child: Image.asset('assets/profile1.png')),
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
                        // showDialog(context: context, builder: (context) {
                        // return  CupertinoAlertDialog(
                        //   content: CupertinoListTile(title: Text('Delete Post')),
                        // );

                        // },);
                        showCupertinoModalPopup(
                          context: context,
                          builder: (context) {
                            return Container(
                              height: 60,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: const CupertinoListTile(
                                  padding: EdgeInsets.only(top: 15),
                                  backgroundColor:
                                      Color.fromARGB(255, 255, 255, 255),
                                  title: Center(
                                      child: Text(
                                    'Delete Post',
                                    style: TextStyle(
                                        color: kBlack,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                              ),
                            );
                          },
                        );
                        // showPopover(
                        //   key: popOverKey,
                        //   width: 200,
                        //   height: 150,
                        //   context: context,
                        //   bodyBuilder: (context) {
                        //     return const SizedBox(
                        //       height: 50,
                        //       width: 100,
                        //       child: Center(
                        //         child: Text('Delete post'),
                        //       ),
                        //     );
                        //   },
                        // );
                      },
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
