import 'package:flutter/material.dart';

class ConfirmPasswordController {
  late TextEditingController newPassword;
  late TextEditingController confirmNewPassword;

  late bool showHide;
  late ValueNotifier<bool> inLoader;
}