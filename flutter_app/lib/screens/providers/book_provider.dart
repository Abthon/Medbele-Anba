import 'dart:convert';
import 'package:jwt_decoder/jwt_decoder.dart';
import '../../utils/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/book.dart';
import 'package:http/http.dart' as http;

final bookDataProvider = FutureProvider<List<Book>>(
  (ref) => BookData().fetchAllBooks(),
);

final searchBooksProvider = Provider<BookData>(
  (ref) => BookData(),
);

final favoriteBookDataProvider = FutureProvider<List<Book>>(
  (ref) => BookData().fetchListOfFavoriteBooks(),
);

final borrowedBookDataProvider = FutureProvider<List<Book>>(
  (ref) => BookData().fetchListOfBorrowedBooks(),
);

class BookData {
  Future<List<Book>> fetchAllBooks() async {
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('access');
    var refresh = prefs.getString('refresh');

    if (JwtDecoder.isExpired(token!)) {
      final response = await http.post(
        Uri.parse('$baseUrl/api/token/refresh/'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(
          {'refresh': '$refresh'},
        ),
      );
      prefs.setString('access', jsonDecode(response.body)['access']);
      prefs.setString('refresh', jsonDecode(response.body)['refresh']);
      token = prefs.getString('access');
      refresh = prefs.getString('refresh');
    }

    final response = await http.get(
      Uri.parse('${baseUrl}books/'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> bookData = jsonDecode(response.body);
      bookData = bookData.cast<Map<String, dynamic>>().toList();
      final listOfBooks = bookData.map(
        (data) => Book(
          id: data['id'],
          isbn: data['isbn'],
          title: data['title'],
          author: data['author'],
          quantity: data['quantity'],
          inserted_date: data['inserted_date'],
          cover_image: data['cover_image'],
        ),
      );
      return listOfBooks.toList();
    } else {
      throw Exception('Failed to load books from the backend!');
    }
  }

  Future<List<Book>> searchBooks(String query) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('access');
      var refresh = prefs.getString('refresh');
      if (JwtDecoder.isExpired(token!)) {
        final response = await http.post(
          Uri.parse('$baseUrl/api/token/refresh/'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(
            {'refresh': '$refresh'},
          ),
        );
        prefs.setString('access', jsonDecode(response.body)['access']);
        prefs.setString('refresh', jsonDecode(response.body)['refresh']);
        token = prefs.getString('access');
        refresh = prefs.getString('refresh');
      }
      final response = await http.get(
        Uri.parse('${baseUrl}search/?query=$query'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> bookData = jsonDecode(response.body);
        bookData = bookData.cast<Map<String, dynamic>>().toList();

        final listOfBooks = bookData.map(
          (data) => Book(
            id: data['id'],
            isbn: data['isbn'],
            title: data['title'],
            author: data['author'],
            quantity: data['quantity'],
            inserted_date: data['inserted_date'],
            cover_image: data['cover_image'],
          ),
        );
        return listOfBooks.toList();
      } else {
        throw Exception('Error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  Future<String> favoriteBook(int id) async {
    final pref = await SharedPreferences.getInstance();
    var token = pref.getString('access');
    var refresh = pref.getString('refresh');
    if (JwtDecoder.isExpired(token!)) {
      final response = await http.post(
        Uri.parse('$baseUrl/api/token/refresh/'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(
          {'refresh': '$refresh'},
        ),
      );
      pref.setString('access', jsonDecode(response.body)['access']);
      pref.setString('refresh', jsonDecode(response.body)['refresh']);
      token = pref.getString('access');
      refresh = pref.getString('refresh');
    }

    final response = await http.post(Uri.parse('${baseUrl}favorite/$id/'),
        headers: {'Authorization': "Bearer $token"});
    if (response.statusCode == 201) {
      return "The book has been added to your favorites successfully, G!";
    } else if (response.statusCode == 200) {
      return "The book has been successfully removed from your favorites, G!";
    } else {
      return "Error tekestowal zemede!";
    }
  }

  Future<List<Book>> fetchListOfFavoriteBooks() async {
    final pref = await SharedPreferences.getInstance();
    var token = pref.getString('access');
    var refresh = pref.getString('refresh');
    if (JwtDecoder.isExpired(token!)) {
      final response = await http.post(
        Uri.parse('$baseUrl/api/token/refresh/'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(
          {'refresh': '$refresh'},
        ),
      );
      pref.setString('access', jsonDecode(response.body)['access']);
      pref.setString('refresh', jsonDecode(response.body)['refresh']);
      token = pref.getString('access');
      refresh = pref.getString('refresh');
    }
    final response = await http.get(
      Uri.parse('${baseUrl}favorited-books/'),
      headers: {
        'Authorization': "Bearer $token",
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> listOfFavoriteBooks = jsonDecode(response.body);
      List<Book> listOfBooks = listOfFavoriteBooks
          .cast<Map<String, dynamic>>()
          .map(
            (json) => Book(
              id: json['book']['id'],
              title: json['book']['title'],
              author: json['book']['author'],
              isbn: json['book']['isbn'],
              quantity: json['book']['quantity'],
              inserted_date: json['book']['inserted_date'],
              cover_image: json['book']['cover_image'],
            ),
          )
          .toList();
      return listOfBooks;
    } else {
      throw Exception("failed to fetch favorite books");
    }
  }

  Future<List<Book>> fetchListOfBorrowedBooks() async {
    final pref = await SharedPreferences.getInstance();
    var token = pref.getString('access');
    var refresh = pref.getString('refresh');
    if (JwtDecoder.isExpired(token!)) {
      print("updating");
      final response = await http.post(
        Uri.parse('$baseUrl/api/token/refresh/'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(
          {'refresh': '$refresh'},
        ),
      );
      pref.setString('access', jsonDecode(response.body)['access']);
      pref.setString('refresh', jsonDecode(response.body)['refresh']);
      token = pref.getString('access');
      refresh = pref.getString('refresh');
    }
    final response = await http.get(
      Uri.parse('${baseUrl}borrowed-books/'),
      headers: {
        'Authorization': "Bearer $token",
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> listOfFavoriteBooks = jsonDecode(response.body);
      List<Book> listOfBooks = listOfFavoriteBooks
          .cast<Map<String, dynamic>>()
          .map(
            (json) => Book(
              id: json['book']['id'],
              title: json['book']['title'],
              author: json['book']['author'],
              isbn: json['book']['isbn'],
              quantity: json['book']['quantity'],
              inserted_date: json['book']['inserted_date'],
              cover_image: json['book']['cover_image'],
            ),
          )
          .toList();
      return listOfBooks;
    } else {
      throw Exception("failed to fetch borrowed books");
    }
  }

  Future<String> borrowBook(int id) async {
    final pref = await SharedPreferences.getInstance();
    var token = pref.getString('access');
    var refresh = pref.getString('refresh');
    if (JwtDecoder.isExpired(token!)) {
      final response = await http.post(
        Uri.parse('$baseUrl/api/token/refresh/'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(
          {'refresh': '$refresh'},
        ),
      );
      pref.setString('access', jsonDecode(response.body)['access']);
      pref.setString('refresh', jsonDecode(response.body)['refresh']);
      token = pref.getString('access');
      refresh = pref.getString('refresh');
    }
    final response = await http.post(Uri.parse('${baseUrl}borrow/$id/'),
        headers: {'Authorization': "Bearer $token"});
    if (response.statusCode == 200) {
      return "Transaction complete, borrowed successfully!";
    } else {
      return "Error occured!";
    }
  }
}
