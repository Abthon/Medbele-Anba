class User {
  // Default user's constructor
  User({
    required this.name,
    required this.username,
    required this.avatar,
  });

  String name;
  String username;
  String avatar;

  // User's factory constructor
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'] as String,
      username: json['username'] as String,
      avatar: json['avatar'] as String,
    );
  }
}
