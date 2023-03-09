import 'package:e_support/src/utils/color_default.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'reset_password_service.dart';

class ResetPasswordServiceImp implements ResetPasswordService {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future<bool> resetPassword({required String email, required BuildContext context}) async {
    try { 
      await auth.sendPasswordResetEmail(email: email);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == "network-request-failed") {
        showDialog(
          context: context, 
          builder: (context) {
            return AlertDialog(
              content: Text(
                "Verifique a ligação a internet",
                style: TextStyle(
                  color: ColorDefault.blackColor.withOpacity(.5),
                  fontFamily: "TiltWarp",
                  fontWeight: FontWeight.w100
                ),
              ),
            );
          }
        );
      } else {
        showDialog(
          context: context, 
          builder: (context) {
            return AlertDialog(
              content: Text(
                "Não há nenhum registo de utilizador correpondente a este e-mail. O utilizador pode ter sido eliminado",
                style: TextStyle(
                  color: ColorDefault.blackColor.withOpacity(.5),
                  fontFamily: "TiltWarp",
                  fontWeight: FontWeight.w100
                ),
              ),
            );
          }
        );
      }
      return false;
    }
  }
    
}