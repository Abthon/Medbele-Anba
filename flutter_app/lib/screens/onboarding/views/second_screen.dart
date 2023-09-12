import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

@immutable
class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

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
                top: 65.0,
              ),
              child: Image.asset('assets/Guided.png'),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              'Guided',
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
                'Explore our platform with confidence through guided tours that help you navigate and utilize every feature effectively.',
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
