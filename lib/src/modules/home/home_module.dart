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
              "Seja bem-vindo",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * .02,
                fontFamily: "TiltWarp",
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.go("/loading_logout_module"), 
              child: Text(
                "Sair",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * .03,
                  fontFamily: "TiltWarp",
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}