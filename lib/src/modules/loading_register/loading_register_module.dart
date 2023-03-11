import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../utils/color_default.dart';
import '../../models/user/user_sign_up.dart';
import '../../services/user/create/user_create_service_imp.dart';

class LoadingRegisterModule extends StatefulWidget {
  const LoadingRegisterModule({super.key, required this.userSignUp});

  final UserSignUp userSignUp;

  @override
  State<LoadingRegisterModule> createState() => _LoadingRegisterModuleState();
}

class _LoadingRegisterModuleState extends State<LoadingRegisterModule> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 8), () async {
      await UserCreateServiceImp().registerUser(
        fullName: widget.userSignUp.fullName,
        email: widget.userSignUp.email,
        password: widget.userSignUp.password,
        context: context,
      ).then((userCredential) {
          if (userCredential != null) return context.go("/check_register");
          return context.go("/auth_module/signup"); 
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