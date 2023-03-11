import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../utils/color_default.dart';
import '../../utils/datetime_default.dart';
import '../../utils/widgets/button_widget.dart';
import '../../utils/widgets/card_service_widget.dart';

class HomeModule extends StatelessWidget {
  const HomeModule({super.key, required this.user});

  final User? user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * .2,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: <Color>[
                      ColorDefault.primaryColor.withOpacity(.8),
                      ColorDefault.primaryColor,
                      ColorDefault.primaryColor,
                      ColorDefault.primaryColor,
                    ]
                  )
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * .05,
                    left: MediaQuery.of(context).size.width * .05,
                    top: MediaQuery.of(context).size.height * .02
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              SizedBox(
                                height: MediaQuery.of(context).size.height * .18,
                                width: MediaQuery.of(context).size.width * .18,
                                child: GestureDetector(
                                  onTap: () => context.go("/home_module/profile_user"),
                                  child: CircleAvatar(
                                    backgroundColor: ColorDefault.whiteColor,
                                    backgroundImage: const AssetImage(
                                      "assets/images/Telma.jpg"
                                    ),
                                    radius: 2,
                                  ),
                                ),
                              ),
                              SizedBox(width: MediaQuery.of(context).size.width * .05),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Olá, Wagner",
                                    style: TextStyle(
                                      color: ColorDefault.whiteColor,
                                      fontFamily: "TiltWarp",
                                      fontSize: MediaQuery.of(context).size.height * .02,
                                      fontWeight: FontWeight.bold,
                                    )
                                  ),
                                  SizedBox(height: MediaQuery.of(context).size.height * .01),
                                  Text(
                                    "Hoje, ${DateTimeDefault.month} de ${DateTime.now().year}",
                                    style: TextStyle(
                                      color: ColorDefault.whiteColor.withOpacity(.5),
                                      fontSize: MediaQuery.of(context).size.height * .02,
                                      fontWeight: FontWeight.w600,
                                    )
                                  )
                                ]
                              )
                            ],
                          ),
                          GestureDetector(
                            onTap: () => context.go("/home_module/notifications_tickets"),
                            child: Icon(
                              Icons.notifications, 
                              color: ColorDefault.whiteColor, 
                              size: MediaQuery.of(context).size.height * .025
                            ),
                          )
                        ]
                      ),
                    ]
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * .05,
                        left: MediaQuery.of(context).size.width * .05,
                        top: MediaQuery.of(context).size.height * .035
                      ),
                      child: Text(
                        "Nossos serviços",
                        style: TextStyle(
                          color: ColorDefault.blackColor,
                          fontSize: MediaQuery.of(context).size.height * .038,
                          fontFamily: "TiltWarp",
                          fontWeight: FontWeight.w200,
                        )
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * .03),
                    SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: <Widget>[
                          const CardServiceWidget(),
                          SizedBox(width: MediaQuery.of(context).size.width * .02),
                          const CardServiceWidget(),
                          SizedBox(width: MediaQuery.of(context).size.width * .02),
                          const CardServiceWidget(),
                          SizedBox(width: MediaQuery.of(context).size.width * .02),
                          const CardServiceWidget()
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: EdgeInsets.only(
          right: MediaQuery.of(context).size.width * .05,
          left: MediaQuery.of(context).size.width * .05,
          bottom: MediaQuery.of(context).size.height * .02,
        ),
        child: ButtonWidget(
          onPressed: () {},
          border: false,
          text: "Solicitar ticket",
          colorText: ColorDefault.whiteColor,
          colorButton: ColorDefault.primaryColor,
          colorBorder: ColorDefault.primaryColor,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * .08,
        ),
      )
    );
  }
}