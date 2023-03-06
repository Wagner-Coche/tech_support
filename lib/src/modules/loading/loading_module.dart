import 'package:e_support/src/models/user/user_sign_in.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:e_support/src/utils/color_default.dart';

import '../../services/user/login/user_login_service_imp.dart';

class LoadingModule extends StatefulWidget {
  const LoadingModule({super.key, required this.userSignIn});

  final UserSignIn userSignIn;

  @override
  State<LoadingModule> createState() => _LoadingModuleState();
}

class _LoadingModuleState extends State<LoadingModule> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 8), () async {
      await UserLoginServiceImp().loginUser(
        email: widget.userSignIn.email,
        password: widget.userSignIn.password,
        context: context,
      ).then((userCredential) {
          if (userCredential != null) return context.go("/home_module", extra: userCredential.user);
          return context.go("/auth_module/signin");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorDefault.whiteColor,
      body: Center(
        child: Lottie.asset(
          "assets/lottie/loading.json",
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width * .8
        )
      ),
    );
  }
}