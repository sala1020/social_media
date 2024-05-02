import 'package:meta/meta.dart';
import 'package:social_media/data/model/profile_model/profile_model.dart';
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
  }
}
