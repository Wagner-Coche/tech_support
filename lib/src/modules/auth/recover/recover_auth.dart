import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:e_support/src/utils/color_default.dart';

import 'controllers/recover_controller.dart';
import '../../../utils/widgets/textfield_widget.dart';
import '../../../validation/textfields_validation.dart';
import '../../../services/user/reset_password/reset_password_service_imp.dart';

class RecoverAuth extends StatefulWidget {
  const RecoverAuth({super.key});

  @override
  State<RecoverAuth> createState() => _RecoverAuthState();
}

class _RecoverAuthState extends State<RecoverAuth> with TextFieldsValidation {
  final formKey = GlobalKey<FormState>();
  final controller = RecoverController();

  @override
  void initState() {
    super.initState();
    controller.inLoader = ValueNotifier<bool>(false);
    controller.emailRecoverController = TextEditingController();
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
                "Redefinir senha",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * .04,
                  fontFamily: "TiltWarp",
                  color: ColorDefault.blackColor,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * .01),
              Text(
                "Digite o e-mail associado a sua conta e enviaremos um e-mail com instruções para redefinir a sua senha",
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
                controller: controller.emailRecoverController, 
                keyBoardType: TextInputType.emailAddress, 
                title: "Enderço e-mail", 
                validator: emailValidator,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * .04),
              SizedBox(
                height: MediaQuery.of(context).size.height * .07,
                child: ValueListenableBuilder<bool>(
                  valueListenable: controller.inLoader,
                  builder: (_, inLoader, __) =>  inLoader ? Center(
                    child: CircularProgressIndicator(
                      color: ColorDefault.primaryColor,
                      strokeWidth: 5,
                    ),
                  ) : SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            setState(() {
                              controller.inLoader = ValueNotifier<bool>(true);
                            });
                            await Future.delayed(const Duration(seconds: 3), () async {
                              await ResetPasswordServiceImp().resetPassword(
                                email: controller.emailRecoverController.text, 
                                context: context
                              ).then((result) {
                                if (result) return context.go("/auth_module/checkemail");
                              });
                            });
                            setState(() {
                              controller.inLoader = ValueNotifier<bool>(false);
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorDefault.primaryColor,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        child: Text(
                          "Solicitar",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height * .02,
                            fontFamily: "TiltWarp",
                            color: ColorDefault.whiteColor,
                          ),
                        )
                      ),
                  ),
                ),
              ),
            ]
          ),
        ),
      )
    );
  }
}