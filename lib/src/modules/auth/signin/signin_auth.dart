import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/color_default.dart';
import 'controllers/signin_controller.dart';
import '../components/button_component.dart';
import '../../../utils/widgets/textfield_widget.dart';
import '../../../validation/textfields_validation.dart';

class SignInAuth extends StatefulWidget {
  const SignInAuth({super.key});

  @override
  State<SignInAuth> createState() => _SignInAuthState();
}

class _SignInAuthState extends State<SignInAuth> with TextFieldsValidation {
  final formKey = GlobalKey<FormState>();
  final controller = SignInController();

  @override
  void initState() {
    super.initState();
    controller.emailController = TextEditingController();
    controller.passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorDefault.primaryColor,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .01),
                child: Image.asset(
                  "assets/images/Call center-bro.png",
                  width: MediaQuery.of(context).size.width * .7,
                )
              ),
            ]
          ),
          Container(
            height: MediaQuery.of(context).size.height * .7,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: ColorDefault.whiteColor,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(25),
                topLeft: Radius.circular(25),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * .04,
                right: MediaQuery.of(context).size.width * .07,
                left: MediaQuery.of(context).size.width * .07
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * .03),
                        child: Text(
                          "Sign In",
                          style: GoogleFonts.righteous(
                            fontSize: MediaQuery.of(context).size.height * .03,
                            color: ColorDefault.primaryColor,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                      TextFieldWidget(
                        validator: emailValidator,
                        controller: controller.emailController,
                        keyBoardType: TextInputType.emailAddress,
                        obscureText: false,
                        title: "Email", 
                        suffixIcon: Icon(Icons.email, color: ColorDefault.greyColor),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * .015),
                      TextFieldWidget(
                        validator: passwordValidator,
                        controller: controller.passwordController,
                        keyBoardType: TextInputType.name,
                        obscureText: true,
                        title: "Password", 
                        suffixIcon: Icon(Icons.key, color: ColorDefault.greyColor),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * .06),
                      ButtonComponent(
                        onPressed: () {
                          if (formKey.currentState!.validate()) return context.go("/loading_module");
                        },
                        border: false,
                        text: "Login",
                        colorText: ColorDefault.whiteColor,
                        colorButton: ColorDefault.primaryColor,
                        colorBorder: ColorDefault.primaryColor,
                        height: MediaQuery.of(context).size.height * .07,
                        width: MediaQuery.of(context).size.width,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * .004),
                        child: Center(
                          child: Text(
                            "──────────── or ────────────",
                            style: GoogleFonts.righteous(color: ColorDefault.greyColor),
                          ),
                        ),
                      ),
                      ButtonComponent(
                        onPressed: () => context.go("/auth_module/signin"),
                        border: true,
                        icon: true,
                        text: "Sign in with Google",
                        colorText: ColorDefault.primaryColor,
                        colorButton: ColorDefault.whiteColor,
                        colorBorder: ColorDefault.primaryColor,
                        height: MediaQuery.of(context).size.height * .07,
                        width: MediaQuery.of(context).size.width,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .03),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account? ",
                              style: GoogleFonts.righteous(color: ColorDefault.greyColor),
                            ),
                            InkWell(
                              onTap: () => context.go("/auth_module/signup"),
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                              splashColor: ColorDefault.greyOtherColor.withOpacity(.3),
                              child: Text(
                                "Sign Up",
                                style: GoogleFonts.righteous(color: ColorDefault.primaryColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ),
        ],
      )
    );
  }
}