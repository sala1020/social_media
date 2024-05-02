import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/data/model/post_model/post_model.dart';
import 'package:social_media/presentation/utils/size/heights.dart';
import 'package:social_media/presentation/view/ineracting_pages/create_post/bloc/create_post_bloc.dart';
import 'package:social_media/presentation/view/ineracting_pages/profile/bloc/profile_bloc.dart';
import 'package:social_media/presentation/view/ineracting_pages/profile/widgets/bio.dart';
import 'package:social_media/presentation/view/ineracting_pages/profile/widgets/button.dart';
import 'package:social_media/presentation/view/ineracting_pages/profile/widgets/post_widget.dart';
import 'package:social_media/presentation/view/ineracting_pages/profile/widgets/section1.dart';

class Profile extends StatelessWidget {
  final List<PostModel> postDetails = [];

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
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is FetchingProfileState) {
            return Column(
              children: [
                ProfileSection1(
                  details: state.userDetail,
                ),
                Bio(
                  details: state.userDetail,
                ),
                const ProfileButtons(),
                kHeight30,
                const Text(
                  'Post',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                kHeight10,
                const Divider(
                  color: Colors.black,
                  endIndent: 20,
                  indent: 20,
                  thickness: 5,
                ),
                kHeight10,
                BlocBuilder<CreatePostBloc, CreatePostState>(
                  builder: (context, state) {
                    if (state is LoadingState) {
                      return const CircularProgressIndicator();
                    }
                    if (state is FetchPostState) {
                      return Expanded(
                        child: Post(
                          post: state.details,
                        ),
                      );
                    }
                    return const Center(
                      child: Text('Empty'),
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
