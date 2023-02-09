import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../utils/color_default.dart';
import '../../utils/widgets/image_logo_app.dart';
import 'components/button_component.dart';

class AuthModule extends StatefulWidget {
  const AuthModule({super.key});

  @override
  State<AuthModule> createState() => _AuthModuleState();
}

class _AuthModuleState extends State<AuthModule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorDefault.primaryColor,
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * .05,
              bottom: MediaQuery.of(context).size.height * .1
            ),
            child: ImageLogoApp(
              fontSize: MediaQuery.of(context).size.height * .02,
              imageWidth: .1,
              topPadding: .004,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .01),
            child: Image.asset(
              "assets/images/Admin-bro.png"
            )
          ),
          Container(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .04),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ButtonComponent(
                  onPressed: () => context.go("/auth_module/signup"),
                  border: false,
                  text: "Sign Up",
                  colorText: ColorDefault.whiteColor,
                  colorButton: ColorDefault.primaryColor,
                  colorBorder: ColorDefault.whiteColor, 
                  height: MediaQuery.of(context).size.height * .085,
                  width: MediaQuery.of(context).size.width * .35,
                ),
                SizedBox(width: MediaQuery.of(context).size.height * .02),
                ButtonComponent(
                  onPressed: () => context.go("/auth_module/signin"),
                  border: true,
                  text: "Sign In",
                  colorText: ColorDefault.primaryColor,
                  colorButton: ColorDefault.whiteColor,
                  colorBorder: ColorDefault.primaryColor,
                  height: MediaQuery.of(context).size.height * .085,
                  width: MediaQuery.of(context).size.width * .35,
                )
              ],
            )
          ),
        ]
      ),
    );
  }
}