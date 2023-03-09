import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:e_support/src/services/user/sign_out/sign_out_service.dart';

class SignOutServiceImp implements SignOutService {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future<bool> signOut({required BuildContext context}) async {
    try {
      await auth.signOut();
      return true;
    } catch (e) {
      debugPrint("Error: $e");
      return false;
    }
  }
}