class UserModel {
  String name;
  String username;
  String email;
  String password;
  String confirmPassword;

  UserModel({
    required this.name,
    required this.username,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      username: json['username'],
      email: json['email'],
      password: json['password'],
      confirmPassword: json['confirmPassword'],
    );
  }
}
