import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:e_support/src/models/user/user_sign_in.dart';

import '../../../utils/color_default.dart';
import 'controllers/signin_controller.dart';
import '../../../utils/widgets/button_widget.dart';
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
    controller.showHide = true;
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
                          "Entrar",
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height * .03,
                            fontFamily: "TiltWarp",
                            color: ColorDefault.primaryColor,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                      TextFieldWidget(
                        validator: emailValidator,
                        controller: controller.emailController,
                        keyBoardType: TextInputType.emailAddress,
                        title: "Email", 
                        suffixIcon: Icon(Icons.email, color: ColorDefault.greyColor),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * .015),
                      TextFieldWidget(
                        showHide: controller.showHide,
                        validator: passwordValidator,
                        controller: controller.passwordController,
                        keyBoardType: TextInputType.name,
                        title: "Senha", 
                        suffixIcon: controller.showHide ? 
                          GestureDetector(
                            onTap: () => setState(() {
                              controller.showHide = !(controller.showHide);
                            }),
                            child: Icon(Icons.visibility, color: ColorDefault.greyColor),
                          ) : 
                          GestureDetector(
                            onTap: () => setState(() {
                              controller.showHide = !(controller.showHide);
                            }),
                            child: Icon(Icons.visibility_off, color: ColorDefault.greyColor),
                          ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .01),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Esqueceu sua senha? ",
                              style: TextStyle(
                                fontSize: MediaQuery.of(context).size.height * .015,
                                fontFamily: "TiltWarp",
                                color: ColorDefault.greyColor
                              ),
                            ),
                            InkWell(
                              onTap: () => context.go("/auth_module/recover"),
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                              splashColor: ColorDefault.greyOtherColor.withOpacity(.3),
                              child: Text(
                                "Recuperar",
                                style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height * .015,
                                  fontFamily: "TiltWarp",
                                  color: ColorDefault.primaryColor
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * .05),
                      ButtonWidget(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            UserSignIn userSignIn = UserSignIn(
                              email: controller.emailController.text, 
                              password: controller.passwordController.text,
                            );
                            return context.go("/loading_module", extra: userSignIn);
                          }
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
                            "──────────── ou ────────────",
                            style: TextStyle(
                              fontFamily: "TiltWarp",
                              color: ColorDefault.greyColor
                            ),
                          ),
                        ),
                      ),
                      ButtonWidget(
                        onPressed: () async {
                          return context.go("/loading_sign_in_google_module");
                        },
                        border: true,
                        icon: true,
                        text: "Entrar com o Google",
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
                              "Não tem uma conta? ",
                              style: TextStyle(
                                fontFamily: "TiltWarp",
                                color: ColorDefault.greyColor
                              ),
                            ),
                            InkWell(
                              onTap: () => context.go("/auth_module/signup"),
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                              splashColor: ColorDefault.greyOtherColor.withOpacity(.3),
                              child: Text(
                                "Registrar",
                                style: TextStyle(
                                  fontFamily: "TiltWarp",
                                  color: ColorDefault.primaryColor
                                ),
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