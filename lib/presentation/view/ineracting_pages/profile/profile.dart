import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/data/model/post_model/post_model.dart';
import 'package:social_media/data/model/profile_model/profile_model.dart';
import 'package:social_media/presentation/utils/shimmer/post_shimmer.dart';
import 'package:social_media/presentation/utils/shimmer/profile_shimmer.dart';
import 'package:social_media/presentation/utils/size/heights.dart';
import 'package:social_media/presentation/view/ineracting_pages/create_post/bloc/create_post_bloc.dart';
import 'package:social_media/presentation/view/ineracting_pages/profile/bloc/profile_bloc.dart';
import 'package:social_media/presentation/view/ineracting_pages/profile/widgets/bio.dart';
import 'package:social_media/presentation/view/ineracting_pages/profile/widgets/button.dart';
import 'package:social_media/presentation/view/ineracting_pages/profile/widgets/post_widget.dart';
import 'package:social_media/presentation/view/ineracting_pages/profile/widgets/section1.dart';

class Profile extends StatelessWidget {
  final List<PostModel> postDetails = [];
  UserProfile user = UserProfile(
      userId: 0,
      name: "name",
      username: "username",
      bio: "bio",
      links: "links",
      userProfileImageUrl: "userProfileImageUrl",
      postsCount: 0,
      followersCount: 0,
      followingCount: 0,
      followingStatus: false);

  Profile({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ProfileBloc>().add(FetchingProfileEvent());
    context.read<CreatePostBloc>().add(FetchPostEvent());

    return SafeArea(
        child: Scaffold(
            body: MultiBlocListener(
      listeners: [
        BlocListener<ProfileBloc, ProfileState>(
          listener: (context, state) {},
        ),
        BlocListener<CreatePostBloc, CreatePostState>(
          listener: (context, state) {},
        ),
      ],
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is LoadingProfileState) {
            return const ProfileShimmer();
          }
          if (state is FetchingProfileState) {
            user = state.userDetail;
            return Column(
              children: [
                ProfileSection1(
                  details: state.userDetail,
                ),
                Bio(
                  details: state.userDetail,
                ),
                const ProfileButtons(),
                kHeight15,
                const Text(
                  'Post',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                ),
                kHeight5,
                const Divider(
                  color: Colors.grey,
                  endIndent: 20,
                  indent: 20,
                  thickness: 2,
                ),
                kHeight10,
                BlocBuilder<CreatePostBloc, CreatePostState>(
                  builder: (context, state) {
                    if (state is LoadingState) {
                      return const Expanded(child: PostShimmer());
                    }
                    if (state is FetchPostState) {
                      return Expanded(
                        child: Post(
                          post: state.details!,
                          profile: user,
                        ),
                      );
                    }
                    if (state is EmptyListState) {
                      return const Expanded(
                        child: Center(
                          child: Text(
                            'Add Some Post',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                      );
                    }

                    return const Center(
                      child: Expanded(child: Text('Some Error Occurede')),
                    );
                  },
                )
              ],
            );
          }
          return const Center(
            child: Text('Error Occured'),
          );
        },
      ),
    )));
  }
}
