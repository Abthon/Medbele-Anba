import 'package:flutter/material.dart';
import 'package:flutter_app/screens/Borrowed/borrowed_books_screen.dart';
import 'package:flutter_app/screens/favorite/favorite_screen.dart';
import 'package:flutter_app/screens/home/home_screen.dart';
import 'package:flutter_app/App/widgets/bottom_navigation.dart';
import 'package:flutter_app/screens/profile/user_profile_screen.dart';
import 'package:flutter_app/screens/providers/page_number_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends ConsumerWidget {
  final List<Widget> pages = [
    const HomeScreen(),
    const BorrowedBookScreen(),
    const FavoriteScreen(),
    const UserProfile()
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageNumber = ref.watch(pageNumberProvider);
    return Scaffold(
      body: pages[pageNumber],
      bottomNavigationBar: const CurvedNavigation(),
    );
  }
}
