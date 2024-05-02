class UserProfile {
  final int userId;
  final String name;
  final String username;
  final String bio;
  final String links;
  final String userProfileImageUrl;
  final int postsCount;
  final int followersCount;
  final int followingCount;
  final bool followingStatus;

  UserProfile({
    required this.userId,
    required this.name,
    required this.username,
    required this.bio,
    required this.links,
    required this.userProfileImageUrl,
    required this.postsCount,
    required this.followersCount,
    required this.followingCount,
    required this.followingStatus,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      userId: json['userid'] ?? 0,
      name: json['name'] ?? "",
      username: json["username"] ??"",
      bio: json['bio'] ?? "",
      links: json['links'] ?? "",
      userProfileImageUrl: json['userprofileimageurl'] ?? "",
      postsCount: json['posts_count'] ?? 0,
      followersCount: json['followers_count'] ?? 0,
      followingCount: json['following_count'] ?? 0,
      followingStatus: json['following_status'] ?? false,
    );
  }
}
