import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeModule extends StatelessWidget {
  const HomeModule({super.key, required this.user});

  final User? user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Seja bem-vindo! ${user!.email}",
          textAlign: TextAlign.center,
          style: GoogleFonts.righteous(
            fontSize: MediaQuery.of(context).size.height * .02
          ),
        ),
      ),
    );
  }
}