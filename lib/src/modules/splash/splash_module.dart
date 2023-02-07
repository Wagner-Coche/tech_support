import 'package:e_support/src/modules/auth/auth_module.dart';
import 'package:flutter/material.dart';

import '../../utils/font_style.dart';
import '../../utils/color_default.dart';

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
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => const AuthModule()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorDefault.primaryColor,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/images/esupport.png",
              width: MediaQuery.of(context).size.width * .18,
            ),
            Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * .008, 
                left: MediaQuery.of(context).size.width * .01
              ),
              child: Text(
                "SUPPORT",
                style: FontStyle.aladin
              ),
            )
          ]
        )
      ),
    );
  }
}

