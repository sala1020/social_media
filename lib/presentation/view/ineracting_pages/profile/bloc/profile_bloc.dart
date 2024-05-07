import 'package:meta/meta.dart';
import 'package:social_media/data/model/profile_model/profile_model.dart';
import 'package:social_media/data/services/post_services/post_services.dart';
import 'package:social_media/data/services/profile_service/profile_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<FetchingProfileEvent>((event, emit) async {
      emit(LoadingProfileState());
      final details = await ProfileService.getUser();
      emit(FetchingProfileState(userDetail: details));
    });
  

    on<LikedPostEvent>((event, emit) async {
      final isResponse = await PostService.likePost(postID: event.postID);
      if (isResponse) {
        emit(LikedPostState(isLiked: true));
      } else {
        emit(LikedPostState(isLiked: false));
      }
    });
  }
}
