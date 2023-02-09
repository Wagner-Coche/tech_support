import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../utils/color_default.dart';
import '../../utils/widgets/image_logo_app.dart';

class SplashModule extends StatefulWidget {
  const SplashModule({super.key});

  @override
  State<SplashModule> createState() => _SplashModuleState();
}

class _SplashModuleState extends State<SplashModule> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 6), () => context.go("/step_module"));
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

