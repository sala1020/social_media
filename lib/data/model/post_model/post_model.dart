class PostModel {
  final int userId;
  final String username;
  final String userProfileImageUrl;
  final int postId;
  final bool likeStatus;
  final String caption;
  final String likesCount;
  final String commentsCount;
  final String postAge;
  final List<String> mediaUrls;

  PostModel({
    required this.userId,
    required this.username,
    required this.userProfileImageUrl,
    required this.postId,
    required this.likeStatus,
    required this.caption,
    required this.likesCount,
    required this.commentsCount,
    required this.postAge,
    required this.mediaUrls,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      userId: json['userid'] ?? 0,
      username: json['username'] ?? '',
      userProfileImageUrl: json['userprofileimageurl'] ?? '',
      postId: json['postid'] ?? 0,
      likeStatus: json['like_status'] ?? false,
      caption: json['caption'] ?? '',
      likesCount: json['likes_count'] ?? '',
      commentsCount: json['comments_count'] ?? '',
      postAge: json['post-age'] ?? '',
      mediaUrls: List<String>.from(json['media-urls'] ?? []),
    );
  }
}
