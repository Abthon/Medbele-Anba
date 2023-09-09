class Book {
  // Book default constructor
  Book({
    required this.id,
    required this.isbn,
    required this.title,
    required this.author,
  });

  // Book model fields
  int id;
  int isbn;
  String title;
  String author;

  // Book factory constructor
  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'] as int,
      isbn: json['isbn'] as int,
      title: json['title'] as String,
      author: json['author'] as String,
    );
  }
}
