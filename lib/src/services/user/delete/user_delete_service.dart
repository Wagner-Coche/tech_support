import 'package:flutter/material.dart';

abstract class UserDeleteService {
  Future<bool> deleteUser({required BuildContext context});
}