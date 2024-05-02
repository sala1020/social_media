// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/presentation/view/ineracting_pages/create_post/bloc/create_post_bloc.dart';
import 'package:social_media/presentation/view/ineracting_pages/create_post/widgets/after_image.dart';
import 'package:social_media/presentation/view/ineracting_pages/create_post/widgets/before_image.dart';

class NewPost extends StatelessWidget {
  NewPost({super.key});
  String? selectedMedia;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<CreatePostBloc, CreatePostState>(
          builder: (context, state) {
            if (state is SelectImageState) {
              selectedMedia = state.imageUrl;
            }
            return selectedMedia == null
                ? const BeforeImageSelection()
                : AfterImageSelection(
                    selectedMedia: selectedMedia!,
                  );
          },
        ),
      ),
    );
  }
}
