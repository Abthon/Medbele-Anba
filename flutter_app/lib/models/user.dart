import 'book.dart';

class User {
  // Create user's constructor
  User({
    required this.name,
    required this.username,
    required this.imageUrl,
    this.favoriteBooks,
  });

  String name;
  String username;
  String imageUrl;
  List<Book>? favoriteBooks;

  // Create user's factory constructor
  // Can be accessed like static methods through the class name
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'] as String,
      username: json['username'] as String,
      imageUrl: json['imageUrl'] as String,
      favoriteBooks: (json['favoriteBooks'] as List)
          .map(
            (bookJson) => Book.fromJson(bookJson),
          )
          .toList(),
    );
  }

  // Convert users object to JSON map
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'username': username,
      'imageUrl': imageUrl,
      'favoriteBooks': favoriteBooks?.map((book) => book.toJson()).toList()
    };
  }
}
