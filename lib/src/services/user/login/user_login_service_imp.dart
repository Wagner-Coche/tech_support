import 'package:firebase_auth/firebase_auth.dart';

import 'user_login_service.dart';
import 'package:flutter/material.dart';
import '../../../utils/color_default.dart';

class UserLoginServiceImp implements UserLoginService {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future<UserCredential?> loginUser({
    required String email,
    required String password,
    required BuildContext context
  }) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email, 
        password: password
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: ColorDefault.redColor,
          dismissDirection: DismissDirection.horizontal,
          duration: const Duration(seconds: 2),
          content: Text(
            textAlign: TextAlign.center,
            "Usuário não encontrado",
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * .015,
              fontFamily: "TiltWarp",
              fontWeight: FontWeight.bold
            )
          )
        ));
      } else if (e.code == "wrong-password") {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: ColorDefault.redColor,
          dismissDirection: DismissDirection.horizontal,
          duration: const Duration(seconds: 2),
          content: Text(
            textAlign: TextAlign.center,
            "Sua senha está errada",
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * .015,
              fontFamily: "TiltWarp",
              fontWeight: FontWeight.bold
            )
          )
        ));
      } else if (e.code == "network-request-failed") {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: ColorDefault.redColor,
          dismissDirection: DismissDirection.horizontal,
          duration: const Duration(seconds: 2),
          content: Text(
            textAlign: TextAlign.center,
            "Verifique a ligação a internet",
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * .015,
              fontFamily: "TiltWarp",
              fontWeight: FontWeight.bold
            )
          )
        ));
      }
    } catch (e) {
      debugPrint("Error: $e");
      return null;
    }
    return null;
  }
}