import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 24.0,
              ),
              child: Image.asset('assets/Secured.png'),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              'Secured',
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
                'Rest assured knowing your data is protected. We employ token authentication to ensure the highest level of security for your account.',
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
