import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../utils/color_default.dart';
import '../../validation/textfields_validation.dart';

class NotificationsTickets extends StatefulWidget {
  const NotificationsTickets({super.key});

  @override
  State<NotificationsTickets> createState() => _NotificationsTicketsState();
}

class _NotificationsTicketsState extends State<NotificationsTickets> with TextFieldsValidation {
  final formKey = GlobalKey<FormState>();
  
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
                            onTap: () => context.go("/home_module"),
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
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * .02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Notificações",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * .04,
                          fontFamily: "TiltWarp",
                          color: ColorDefault.blackColor,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .06,
                        child: InkWell(
                          onTap: () {},
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * .02),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  "Marcar como lidas",
                                  style: TextStyle(
                                    fontSize: MediaQuery.of(context).size.height * .018,
                                    fontFamily: "TiltWarp",
                                    color: ColorDefault.blueColor,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width * .002),
                                Icon(Icons.check, size: MediaQuery.of(context).size.height * .02, color: ColorDefault.blueColor)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * .05),
                  Center(
                    child: Image.asset(
                      "assets/images/Push notifications-rafiki.png",
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width * .9,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * .02),
                  Center(
                    child: Text(
                      "Sem notificações",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * .025,
                        fontFamily: "TiltWarp",
                        color: ColorDefault.blackColor.withOpacity(.5),
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ]
              ),
            ),
        ),
      ),
    );
  }
}