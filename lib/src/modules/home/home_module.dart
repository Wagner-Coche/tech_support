import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeModule extends StatelessWidget {
  const HomeModule({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Welcome user",
          textAlign: TextAlign.center,
          style: GoogleFonts.righteous(
            fontSize: MediaQuery.of(context).size.height * .07
          ),
        ),
      ),
    );
  }
}