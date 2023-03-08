import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../utils/color_default.dart';
import '../../services/user/signin_google/signin_google_service_imp.dart';

class LoadingSignInGoogleModule extends StatefulWidget {
  const LoadingSignInGoogleModule({super.key});

  @override
  State<LoadingSignInGoogleModule> createState() => _LoadingSignInGoogleModuleState();
}

class _LoadingSignInGoogleModuleState extends State<LoadingSignInGoogleModule> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () async {
      await SignInGoogleServiceImp().loginUserWithGoogle().then((userCredential) {
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