import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class UserLoginService {
  Future<UserCredential?> loginUser({
    required String email,
    required String password,
    required BuildContext context
  });
}