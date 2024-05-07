// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_media/data/model/post_model/post_model.dart';
import 'package:social_media/data/services/post_services/post_services.dart';

part 'create_post_event.dart';
part 'create_post_state.dart';

class CreatePostBloc extends Bloc<CreatePostEvent, CreatePostState> {
  CreatePostBloc() : super(CreatePostInitial()) {
    on<SelectImageEvent>((event, emit) async {
      final imagePicker = ImagePicker();
      final image = await imagePicker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        emit(SelectImageState(imageUrl: image.path.toString()));
      }
    });

    on<PutPostEvent>((event, emit) async {
      final isPosted = await PostService.uploadPost(
          media: event.mediaUrl, caption: event.caption);
      if (isPosted) {
        emit(LoadingState());
        emit(SelectImageState(imageUrl: ''));
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: snackBarWidget(
              context: event.context, snackBarContent: 'Seccussfully Posted'),
        );
      } else {
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: snackBarWidget(
              context: event.context, snackBarContent: 'Posting Failed'),
        );
      }
    });
    on<FetchPostEvent>((event, emit) async {
      emit(LoadingState());
      final List<PostModel> postDetails = await PostService.getpost();
      if (postDetails.isNotEmpty) {
        emit(FetchPostState(details: postDetails));
      } else {
        emit(EmptyListState());
      }
    });
    on<PostDeleteEvent>((event, emit) async {
      final result = await PostService.postDelete(postID: event.postID);
      if (result) {
        final List<PostModel> postDetails = await PostService.getpost();
        if (postDetails.isNotEmpty) {
          emit(FetchPostState(details: postDetails));
        } else {
          emit(EmptyListState());
        }
      }
    });
  }
}

snackBarWidget(
    {required BuildContext context, required String snackBarContent}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      shape: const Border(
        left: BorderSide(width: BorderSide.strokeAlignCenter),
      ),
      backgroundColor: Colors.black,
      duration: const Duration(milliseconds: 700),
      content: Text(snackBarContent),
    ),
  );
}
