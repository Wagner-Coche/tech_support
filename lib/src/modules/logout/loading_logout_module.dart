import 'package:e_support/src/services/user/sign_out/sign_out_service_imp.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:e_support/src/utils/color_default.dart';

class LoadingLogoutModule extends StatefulWidget {
  const LoadingLogoutModule({super.key});

  @override
  State<LoadingLogoutModule> createState() => _LoadingLogoutModuleState();
}

class _LoadingLogoutModuleState extends State<LoadingLogoutModule> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () async {
      await SignOutServiceImp().signOut(context: context).then((result) {
        if (result) return context.go("/auth_module/signin");
        return context.go("/home_module");
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