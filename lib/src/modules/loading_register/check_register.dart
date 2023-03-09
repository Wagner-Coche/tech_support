import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../utils/color_default.dart';

class CheckRegister extends StatefulWidget {
  const CheckRegister({super.key});

  @override
  State<CheckRegister> createState() => _CheckRegisterState();
}

class _CheckRegisterState extends State<CheckRegister> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 7), () => context.go("/auth_module/signin"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorDefault.whiteColor,
      body: Center(
        child: Lottie.asset(
          "assets/lottie/76649-checked.json",
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width * .4
        )
      ),
    );
  }
}