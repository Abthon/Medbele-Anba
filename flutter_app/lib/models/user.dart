import 'book.dart';
import 'dart:io';

class User {
  // Create user's constructor
  User({
    this.firstName = '',
    this.lastName = '',
    this.username = '',
    this.email = '',
    this.password = '',
    this.imageUrl = '',
    this.favoriteBooks,
    this.profileImage,
  });

  String firstName;
  String lastName;
  String username;
  String email;
  String password;
  String imageUrl;
  List<Book>? favoriteBooks;
  File? profileImage;

  User copyWith({
    String? username,
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    File? profileImage,
  }) {
    return User(
      username: username ?? this.username,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
      profileImage: profileImage ?? this.profileImage,
    );
  }

  // Create user's factory constructor
  // Can be accessed like static methods through the class name
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      imageUrl: json['imageUrl'] as String,
      favoriteBooks: (json['favoriteBooks'] as List)
          .map(
            (bookJson) => Book.fromJson(bookJson),
          )
          .toList(),
    );
  }

  // // Convert users object to JSON map
  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'username': username,
      'email': email,
      'password': password,
      'imageUrl': imageUrl,
      'favoriteBooks': favoriteBooks?.map((book) => book.toJson()).toList()
    };
  }
}
