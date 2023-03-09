import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../utils/color_default.dart';

class CheckEmailResetPassword extends StatelessWidget {
  const CheckEmailResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorDefault.whiteColor,
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * .17,
          bottom: MediaQuery.of(context).size.height * .05,
          right: MediaQuery.of(context).size.width * .04,
          left: MediaQuery.of(context).size.width * .04
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Center(
                      child: Container(
                        height: MediaQuery.of(context).size.height * .2,
                        width: MediaQuery.of(context).size.width * .5,
                        decoration: BoxDecoration(
                          color: ColorDefault.primaryColor.withOpacity(.2),
                          borderRadius: const BorderRadius.all(Radius.circular(15)),
                        ),
                      ),
                    ),
                    Center(
                      child: Image.asset(
                        "assets/images/tick.png",
                        width: MediaQuery.of(context).size.width * .25,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .02),
                Text(
                  "Verifique seu e-mail",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * .04,
                    fontFamily: "TiltWarp",
                    color: ColorDefault.blackColor,
                    fontWeight: FontWeight.w100
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .02),
                Text(
                  "Enviamos instruções de recuperação de senha para o seu e-mail",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * .02,
                    fontFamily: "TiltWarp",
                    color: ColorDefault.blackColor.withOpacity(.3),
                    fontWeight: FontWeight.w100
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .04),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .07,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () async {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorDefault.primaryColor,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    child: Text(
                      "Abrir Gmail",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * .02,
                        fontFamily: "TiltWarp",
                        color: ColorDefault.whiteColor,
                      ),
                    )
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .02),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .07,
                  width: MediaQuery.of(context).size.width,
                  child: InkWell(
                    onTap: () async {
                      await Future.delayed(const Duration(seconds: 2), () {
                        return context.go("/auth_module/signin");
                      });
                    },
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: Center(
                      child: Text(
                        "Pular, confirmar depois",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * .02,
                          fontFamily: "TiltWarp",
                          color: ColorDefault.blackColor.withOpacity(.3),
                        ),
                      ),
                    ),
                  ),
                ),
              ]
            ),
            Column(
              children: <Widget>[
                Center(
                  child: Text(
                    "Você não recebeu o e-mail? Verifique seu filtro de spam ou ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * .016,
                      fontFamily: "TiltWarp",
                      color: ColorDefault.blackColor.withOpacity(.3),
                      fontWeight: FontWeight.w100
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .01),
                GestureDetector(
                  onTap: () => context.go("/auth_module/recover"),
                  child: Center(
                    child: Text(
                      "Tente um outro endereço de e-mail",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * .016,
                        fontFamily: "TiltWarp",
                        color: ColorDefault.primaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}