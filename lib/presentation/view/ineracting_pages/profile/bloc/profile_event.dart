part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {}


final class FetchingProfileEvent extends ProfileEvent{}


final class LikedPostEvent extends ProfileEvent{
    final String postID;

  LikedPostEvent({required this.postID});
}