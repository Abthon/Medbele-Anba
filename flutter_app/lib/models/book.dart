class Book {
  // Create book default constructor
  Book({
    required this.id,
    required this.isbn,
    required this.title,
    required this.author,
    required this.cover_image,
  });

  int id;
  String isbn;
  String title;
  String author;
  String cover_image;

  // Create book's factory constructor
  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'] as int,
      isbn: json['isbn'] as String,
      title: json['title'] as String,
      author: json['author'] as String,
      cover_image: json['cover_image'] as String,
    );
  }

  // Convert books object to JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'isbn': isbn,
      'title': title,
      'author': author,
      'cover_image': cover_image,
    };
  }
}
