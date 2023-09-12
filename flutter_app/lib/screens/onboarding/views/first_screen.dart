import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

@immutable
class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                bottom: 30.0,
                top: 100.0,
              ),
              child: Image.asset(
                'assets/EasyToUse.png',
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              'Easy',
              style: GoogleFonts.delius(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
                right: 10.0,
              ),
              child: Text(
                'Our platform offers a seamless and user-friendly experience, making your reading journey effortless and enjoyable',
                textAlign: TextAlign.center,
                style: GoogleFonts.delius(
                  fontSize: 17.0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
