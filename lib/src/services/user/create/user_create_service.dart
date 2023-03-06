import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class UserCreateService {
  Future<UserCredential?> registerUser({    
    required String fullName, 
    required String email, 
    required String password, 
    required BuildContext context
  });
}           