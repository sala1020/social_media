part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class FetchingProfileState extends ProfileState {
  final UserProfile userDetail;

  FetchingProfileState({required this.userDetail});
}

final class LoadingProfileState extends ProfileState {}

final class LikedPostState extends ProfileState{
  final bool isLiked;

  LikedPostState({required this.isLiked});
}