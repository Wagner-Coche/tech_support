import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'user_create_service.dart';
import '../../../utils/color_default.dart';

class UserCreateServiceImp implements UserCreateService {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future<UserCredential?> registerUser({    
    required String fullName, 
    required String email, 
    required String password, 
    required BuildContext context
  }) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email, 
        password: password
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: ColorDefault.redColor,
          dismissDirection: DismissDirection.horizontal,
          duration: const Duration(seconds: 2),
          content: Text(
            textAlign: TextAlign.center,
            "Password muito fraca",
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * .015,
              fontFamily: "TiltWarp",
              fontWeight: FontWeight.bold
            )
          )
        ));
      } else if (e.code == "email-already-in-use") {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: ColorDefault.redColor,
          dismissDirection: DismissDirection.horizontal,
          duration: const Duration(seconds: 2),
          content: Text(
            textAlign: TextAlign.center,
            "Este email já está cadastrado",
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * .015,
              fontFamily: "TiltWarp",
              fontWeight: FontWeight.bold
            )
          )
        ));
      } 
    } catch (e) {
      print("Error: $e");
      return null;
    }
    return null;
   }
}