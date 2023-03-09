import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:e_support/src/utils/color_default.dart';

import 'controllers/confirm_password_controller.dart';
import '../../../utils/widgets/textfield_widget.dart';
import '../../../validation/textfields_validation.dart';

class ConfirmPassword extends StatefulWidget {
  const ConfirmPassword({super.key});

  @override
  State<ConfirmPassword> createState() => _ConfirmPasswordState();
}

class _ConfirmPasswordState extends State<ConfirmPassword> with TextFieldsValidation {
  final formKey = GlobalKey<FormState>();
  final controller = ConfirmPasswordController();

  @override
  void initState() {
    super.initState();
    controller.showHide = true;
    controller.inLoader = ValueNotifier<bool>(false);
    controller.newPassword = TextEditingController();
    controller.confirmNewPassword = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorDefault.whiteColor,
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * .06,
          right: MediaQuery.of(context).size.width * .04,
          left: MediaQuery.of(context).size.width * .04
        ),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .06,
                        width: MediaQuery.of(context).size.width * .2,
                        child: InkWell(
                          onTap: () => context.go("/auth_module/signin"),
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          child: Row(
                            children: <Widget> [
                              Icon(Icons.arrow_back, color: ColorDefault.blackColor, size: MediaQuery.of(context).size.height * .03),
                              SizedBox(width: MediaQuery.of(context).size.width * .003),
                              Text(
                                "Voltar",
                                style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height * .02,
                                  fontFamily: "TiltWarp",
                                  color: ColorDefault.blackColor,
                                ),
                              )
                            ]
                          ),
                        ),
                      ),
                      Icon(Icons.help_outline, color: ColorDefault.blackColor, size: MediaQuery.of(context).size.height * .025)
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .02),
                Text(
                  "Criar nova senha",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * .04,
                    fontFamily: "TiltWarp",
                    color: ColorDefault.blackColor,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .01),
                Text(
                  "Sua nova senha deve ser diferente das senhas usadas anteriormente",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * .021,
                    fontFamily: "TiltWarp",
                    color: ColorDefault.blackColor.withOpacity(.3),
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .04),
                TextFieldWidget(
                  showHide: controller.showHide,
                  controller: controller.newPassword, 
                  keyBoardType: TextInputType.name, 
                  title: "Nova senha", 
                  validator: passwordValidator,
                  suffixIcon: controller.showHide ? 
                    GestureDetector(
                      onTap: () => setState(() {
                        controller.showHide = !(controller.showHide);
                      }),
                      child: Icon(Icons.visibility, color: ColorDefault.greyColor),
                    ) : GestureDetector(
                      onTap: () => setState(() {
                        controller.showHide = !(controller.showHide);
                      }),
                      child: Icon(Icons.visibility_off, color: ColorDefault.greyColor),
                    ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .02),
                TextFieldWidget(
                  showHide: controller.showHide,
                  controller: controller.confirmNewPassword, 
                  keyBoardType: TextInputType.name, 
                  title: "Confirmar nova senha", 
                  validator: passwordValidator,
                  suffixIcon: controller.showHide ? 
                    GestureDetector(
                      onTap: () => setState(() {
                        controller.showHide = !(controller.showHide);
                      }),
                      child: Icon(Icons.visibility, color: ColorDefault.greyColor),
                    ) : GestureDetector(
                      onTap: () => setState(() {
                        controller.showHide = !(controller.showHide);
                      }),
                      child: Icon(Icons.visibility_off, color: ColorDefault.greyColor),
                    ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .04),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .07,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ValueListenableBuilder<bool>(
                      valueListenable: controller.inLoader,
                      builder: (_, inLoader, __) => inLoader ? Center(
                        child: CircularProgressIndicator(
                          color: ColorDefault.primaryColor,
                          strokeWidth: 5,
                        ),
                      ) : ElevatedButton(
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              if (controller.newPassword.text != controller.confirmNewPassword.text) {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  backgroundColor: ColorDefault.redColor,
                                  dismissDirection: DismissDirection.horizontal,
                                  duration: const Duration(seconds: 2),
                                  content: Text(
                                    textAlign: TextAlign.center,
                                    "Senhas estão diferentes",
                                    style: TextStyle(
                                      fontSize: MediaQuery.of(context).size.height * .015,
                                      fontWeight: FontWeight.bold
                                    )
                                  )
                                ));
                              } else {
                                setState(() {
                                  controller.inLoader = ValueNotifier<bool>(true);
                                });
                                await Future.delayed(const Duration(seconds: 5));
                                setState(() {
                                  controller.inLoader = ValueNotifier<bool>(false);
                                });
                                return context.go("/check_register");
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorDefault.primaryColor,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                          child: Text(
                            "Redefinir senha",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.height * .02,
                              fontFamily: "TiltWarp",
                              color: ColorDefault.whiteColor,
                            ),
                          )
                        )
                    ),
                  ),
                ),
              ]
            ),
          ),
        ),
      )
    );
  }
}