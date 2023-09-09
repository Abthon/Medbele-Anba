class Book {
  // Book's default constructor
  Book({
    required this.id,
    required this.isbn,
    required this.title,
    required this.author,
  });

  int id;
  int isbn;
  String title;
  String author;

  // Book's factory constructor
  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'] as int,
      isbn: json['isbn'] as int,
      title: json['title'] as String,
      author: json['author'] as String,
    );
  }
}
