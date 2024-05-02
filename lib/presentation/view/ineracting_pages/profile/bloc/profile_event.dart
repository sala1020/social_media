part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {}


final class FetchingProfileEvent extends ProfileEvent{}