import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import '../../utils/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/user.dart';
import 'package:http/http.dart' as http;

final userControllerProvider =
    StateNotifierProvider<UserController, User>((ref) => UserController());

class UserController extends StateNotifier<User> {
  UserController() : super(User());

  void setUsername(String username) {
    state = state.copyWith(username: username);
  }

  void setFirstName(String firstName) {
    state = state.copyWith(firstName: firstName);
  }

  void setLastName(String lastName) {
    state = state.copyWith(lastName: lastName);
  }

  void setEmail(String email) {
    state = state.copyWith(email: email);
  }

  void setPassword(String password) {
    state = state.copyWith(password: password);
  }

  void setPhoto(File profileImage) {
    state = state.copyWith(profileImage: profileImage);
  }

  Future<void> createUser() async {
    final request =
        http.MultipartRequest('POST', Uri.parse('${baseUrl}register/'));
    request.fields['user_name'] = state.username;
    request.fields['first_name'] = state.firstName;
    request.fields['last_name'] = state.lastName;
    request.fields['email'] = state.email;
    request.fields['password'] = state.password;

    if (state.profileImage != null) {
      final file = await http.MultipartFile.fromPath(
          'profile_image ', state.profileImage!.path);
      request.files.add(file);
    }

    print(state.profileImage!.path);
    final response = await request.send();
    print(response.statusCode);
    if (response.statusCode == 201) {
      print('User created successfully');
    } else {
      print('Error creating user: ${response.reasonPhrase}');
    }
  }

  Future<bool> authenticateUser() async {
    // Check if the Token is already in the user device before going to the server side
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('accessx')) {
      return true; // the user has already the token key in his device in this case.
    } else {
      final response = await http.post(
        Uri.parse('${baseUrl}api/token/'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(
            {'user_name': state.username, 'password': state.password}),
      );

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        // Save the user token locally in the users device
        prefs.setString('access', body['access']);
        prefs.setString('refresh', body['refresh']);
        return true;
      } else {
        return false; // the user inputs an invalid input as his credentials in this case
      }
    }
  }
}

final userDataProvider =
    FutureProvider<Map<String, dynamic>>((ref) => UserData().fetchUserData());

class UserData {
  Map<String, dynamic> userData = {};

  Future<Map<String, dynamic>> fetchUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('access');
    final response = await http.get(
      Uri.parse('${baseUrl}user/profile/'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      userData = json.decode(response.body);
      return userData;
    } else {
      return userData;
      // throw Exception('Failed to load user data');
    }
  }
}
