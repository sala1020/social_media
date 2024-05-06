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
      await PostService.uploadPost(
          media: event.mediaUrl, caption: event.caption);
          emit(SelectImageState(imageUrl: ''));
      emit(LoadingState());
    });
    on<FetchPostEvent>((event, emit) async {
      emit(LoadingState());
      final postDetails = await PostService.getpost();

      if (postDetails.isNotEmpty) {
        emit(FetchPostState(details: postDetails));
      }
    });
  }
}
