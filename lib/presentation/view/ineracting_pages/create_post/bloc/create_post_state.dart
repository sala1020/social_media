part of 'create_post_bloc.dart';

@immutable
sealed class CreatePostState {}

final class CreatePostInitial extends CreatePostState {}

final class SelectImageState extends CreatePostState {
  final String imageUrl;

  SelectImageState({required this.imageUrl});
}

final class PutPostState extends CreatePostState {}

final class LoadingState extends CreatePostState{}
final class EmptyListState extends CreatePostState{}

final class FetchPostState extends CreatePostState {
  final List<PostModel>? details;

  FetchPostState({required this.details});
}

final class PostDeleteState extends CreatePostState{}
