import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'auth_check_service.dart';

class AuthCheckServiceImp implements AuthCheckService {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  authCheck({required BuildContext context}) async {
    auth.authStateChanges().listen((User? user) {
      if (user != null) {
        context.go("/home_module", extra: user);
      } else {
        context.go("/auth_module");
      }
    });
  }
}