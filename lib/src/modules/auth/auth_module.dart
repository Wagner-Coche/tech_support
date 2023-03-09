import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../utils/color_default.dart';
import '../../utils/widgets/image_logo_app.dart';
import '../../utils/widgets/button_widget.dart';

class AuthModule extends StatefulWidget {
  const AuthModule({super.key});

  @override
  State<AuthModule> createState() => _AuthModuleState();
}

class _AuthModuleState extends State<AuthModule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorDefault.whiteColor,
      body: Padding(
        padding: EdgeInsets.only(
          right: MediaQuery.of(context).size.width * .05,
          left: MediaQuery.of(context).size.width * .05,
          bottom: MediaQuery.of(context).size.height * .02,
        ),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .18),
              child: Image.asset(
                "assets/images/Business deal-pana.png",
              )
            ),
            Container(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .11),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ButtonWidget(
                    onPressed: () => context.go("/auth_module/signup"),
                    border: false,
                    text: "Registrar",
                    colorText: ColorDefault.whiteColor,
                    colorButton: ColorDefault.primaryColor,
                    colorBorder: ColorDefault.whiteColor, 
                    height: MediaQuery.of(context).size.height * .085,
                    width: MediaQuery.of(context).size.width,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * .02),
                  ButtonWidget(
                    onPressed: () => context.go("/auth_module/signin"),
                    border: true,
                    text: "Entrar",
                    colorText: ColorDefault.primaryColor,
                    colorButton: ColorDefault.whiteColor,
                    colorBorder: ColorDefault.primaryColor,
                    height: MediaQuery.of(context).size.height * .085,
                    width: MediaQuery.of(context).size.width,
                  )
                ],
              )
            ),
          ]
        ),
      ),
    );
  }
}