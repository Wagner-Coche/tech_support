import 'package:flutter/material.dart';
import 'package:e_support/src/modules/step/step_module.dart';

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
    Future.delayed(const Duration(seconds: 6)).then((value) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => const StepModule()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorDefault.primaryColor,
      body: const Center(
        child: ImageLogoApp(
          fontSize: 26,
          imageWidth: .18,
          topPadding: .008,
        )
      ),
    );
  }
}

