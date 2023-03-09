import 'package:flutter/material.dart';

abstract class ResetPasswordService {
  Future<bool> resetPassword({required String email, required BuildContext context});
}