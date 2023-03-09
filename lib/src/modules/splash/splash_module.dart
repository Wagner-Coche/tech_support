import 'package:flutter/material.dart';

import '../../utils/color_default.dart';
import 'package:go_router/go_router.dart';
import '../../utils/widgets/image_logo_app.dart';
import '../../services/user/auth_check/auth_check_service_imp.dart';

class SplashModule extends StatefulWidget {
  const SplashModule({super.key});

  @override
  State<SplashModule> createState() => _SplashModuleState();
}

class _SplashModuleState extends State<SplashModule> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () async {
      await AuthCheckServiceImp().authCheck(context: context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorDefault.primaryColor,
      body: Center(
        child: ImageLogoApp(
          fontSize: MediaQuery.of(context).size.height * .032,
          imageWidth: .18,
          topPadding: .008,
        )
      ),
    );
  }
}

