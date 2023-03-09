import 'package:flutter/material.dart';

abstract class SignOutService {
  Future<bool> signOut({required BuildContext context});
}