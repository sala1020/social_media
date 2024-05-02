part of 'create_post_bloc.dart';

@immutable
sealed class CreatePostEvent {}

final class SelectImageEvent extends CreatePostEvent{}

final class PutPostEvent extends CreatePostEvent{
  final String caption;
  final String mediaUrl;
  final BuildContext context;
  PutPostEvent( {required this.caption, required this.mediaUrl,required this.context,});
}
final class FetchPostEvent extends CreatePostEvent{}