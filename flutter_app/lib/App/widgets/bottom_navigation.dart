import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_app/screens/providers/page_number_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CurvedNavigation extends ConsumerWidget {
  const CurvedNavigation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CurvedNavigationBar(
      backgroundColor: Colors.grey.shade50,
      color: const Color(0xff5165EA),
      animationDuration: const Duration(milliseconds: 200),
      buttonBackgroundColor: const Color(0xff4A5AEA),
      onTap: (index) {
        ref.read(pageNumberProvider.notifier).setPage(index);
      },
      items: const <Widget>[
        Icon(
          CupertinoIcons.home,
          size: 30,
          color: Colors.white,
        ),
        Icon(
          CupertinoIcons.book_circle,
          size: 30,
          color: Colors.white,
        ),
        Icon(
          Icons.bookmark_add_outlined,
          size: 30,
          color: Colors.white,
        ),
        Icon(
          Icons.person_outline_rounded,
          size: 30,
          color: Colors.white,
        ),
      ],
    );
  }
}
