import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:e_support/src/utils/color_default.dart';
import 'package:e_support/src/utils/widgets/textfield_widget.dart';

import '../../../models/user/user_sign_up.dart';
import 'controllers/signup_controller.dart';
import '../components/button_component.dart';
import '../../../validation/textfields_validation.dart';

class SignUpAuth extends StatefulWidget {
  const SignUpAuth({super.key});

  @override
  State<SignUpAuth> createState() => _SignUpAuthState();
}

class _SignUpAuthState extends State<SignUpAuth> with TextFieldsValidation {
  bool active = false;
  final formKey = GlobalKey<FormState>();
  final controller = SignUpController();

  @override
  void initState() {
    super.initState();
    controller.showHide = false;
    controller.fullNameController = TextEditingController();
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
                  width: MediaQuery.of(context).size.width * .5,
                )
              ),
            ]
          ),
          Container(
            height: MediaQuery.of(context).size.height * .8,
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
                          "Registrar",
                          style: GoogleFonts.righteous(
                            fontSize: MediaQuery.of(context).size.height * .03,
                            color: ColorDefault.primaryColor,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                      TextFieldWidget(
                        validator: fullNameValidator,
                        controller: controller.fullNameController,
                        keyBoardType: TextInputType.name,
                        title: "Nome completo", 
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * .015),
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
                          )
                      ),
                      Container(
                        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .01),
                        child: Row(
                          children: <Widget>[
                            Checkbox(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(5))
                              ),
                              activeColor: ColorDefault.primaryColor,
                              checkColor: ColorDefault.whiteColor,
                              value: active, 
                              onChanged: (value) {
                                setState(() {
                                  active = value!;
                                });
                              }
                            ),
                            Expanded(
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    "I agree to the ",
                                    style: GoogleFonts.righteous(
                                      fontSize: MediaQuery.of(context).size.height * .018,
                                      color: ColorDefault.greyOtherColor
                                    ),
                                  ),
                                  Text(
                                    "Terms ",
                                    style: GoogleFonts.righteous(
                                      fontSize: MediaQuery.of(context).size.height * .018,
                                      color: ColorDefault.primaryColor
                                    ),
                                  ),
                                  Text(
                                    "and ",
                                    style: GoogleFonts.righteous(
                                      fontSize: MediaQuery.of(context).size.height * .018,
                                      color: ColorDefault.greyOtherColor
                                    ),
                                  ),
                                  Text(
                                    "Conditions",
                                    style: GoogleFonts.righteous(
                                      fontSize: MediaQuery.of(context).size.height * .018,
                                      color: ColorDefault.primaryColor
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      ),
                      ButtonComponent(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            UserSignUp userSignUp = UserSignUp(
                              fullName: controller.fullNameController.text,
                              email: controller.emailController.text, 
                              password: controller.emailController.text,
                            );
                            return context.go("/loading_register_module", extra: userSignUp);
                          }
                        },
                        border: false,
                        text: "Criar conta",
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
                            style: GoogleFonts.righteous(color: ColorDefault.greyColor),
                          ),
                        ),
                      ),
                      ButtonComponent(
                        onPressed: () {},
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
                              "Já tem uma conta? ",
                              style: GoogleFonts.righteous(color: ColorDefault.greyColor),
                            ),
                            InkWell(
                              onTap: () => context.go("/auth_module/signin"),
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                              splashColor: ColorDefault.greyOtherColor.withOpacity(.3),
                              child: Text(
                                "Entrar",
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