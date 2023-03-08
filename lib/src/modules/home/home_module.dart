import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeModule extends StatelessWidget {
  const HomeModule({super.key, required this.user});

  final User? user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Seja bem-vindo! ${user!.email}",
              textAlign: TextAlign.center,
              style: GoogleFonts.righteous(
                fontSize: MediaQuery.of(context).size.height * .02
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                return context.go("/loading_logout_module");
              }, 
              child: Text(
                "Sair",
                style: GoogleFonts.righteous(
                  fontSize: MediaQuery.of(context).size.height * .03
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}