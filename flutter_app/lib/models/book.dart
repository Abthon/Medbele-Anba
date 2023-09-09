class Book {
  // Create book default constructor
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

  // Create book's factory constructor
  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'] as int,
      isbn: json['isbn'] as int,
      title: json['title'] as String,
      author: json['author'] as String,
    );
  }

  // Convert books object to JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'isbn': isbn,
      'title': title,
      'author': author,
    };
  }
}
