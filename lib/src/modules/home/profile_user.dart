import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../services/user/delete/user_delete_service_imp.dart';
import '../../utils/color_default.dart';
import '../../utils/widgets/button_widget.dart';
import '../../utils/widgets/listtile_widget.dart';

class ProfileUser extends StatefulWidget {
  const ProfileUser({super.key});

  @override
  State<ProfileUser> createState() => _ProfileUserState();
}

class _ProfileUserState extends State<ProfileUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorDefault.whiteColor,
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * .06,
              right: MediaQuery.of(context).size.width * .04,
              left: MediaQuery.of(context).size.width * .04
            ),
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
                      children: <Widget>[
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
                Center(
                  child: Text(
                    "Perfil",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * .02,
                      fontFamily: "TiltWarp",
                      color: ColorDefault.blackColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              Container(
                alignment: Alignment.bottomCenter,
                height: MediaQuery.of(context).size.height * .18,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: ColorDefault.primaryColor
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * .04,
                  left: MediaQuery.of(context).size.width * .04,
                ),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height * .04,
                      ),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * .2,
                        width: MediaQuery.of(context).size.width * .3,
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
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * .04),
                    Column(
                      children: <Widget>[
                        Text(
                          "Telma Damião",
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height * .03,
                            fontFamily: "TiltWarp",
                            color: ColorDefault.whiteColor,
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * .004),
                        Text(
                          "telmadamiao015@gmail.com",
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height * .015,
                            fontFamily: "TiltWarp",
                            color: ColorDefault.whiteColor.withOpacity(.3),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),     
          SizedBox(height: MediaQuery.of(context).size.height * .03),
          Column(
            children: <Widget>[
              ListTileWidget(
                onTap: () {  },
                title: "Tickets",
                leading: Icon(Icons.favorite, color: ColorDefault.blackColor),
                trailing: Icon(Icons.arrow_forward_ios, color: ColorDefault.blackColor),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * .01),
              ListTileWidget(
                onTap: () {  },
                title: "Alterar senha",
                leading: Icon(Icons.password, color: ColorDefault.blackColor),
                trailing: Icon(Icons.arrow_forward_ios, color: ColorDefault.blackColor),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * .01),
              ListTileWidget(
                onTap: () {  },
                title: "Actualizar e-mail",
                leading: Icon(Icons.email, color: ColorDefault.blackColor),
                trailing: Icon(Icons.arrow_forward_ios, color: ColorDefault.blackColor),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * .01),
              ListTileWidget(
                onTap: () {  },
                title: "Alterar nome",
                leading: Icon(Icons.description, color: ColorDefault.blackColor),
                trailing: Icon(Icons.arrow_forward_ios, color: ColorDefault.blackColor),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * .01),
            ],
          ), 
          SizedBox(height: MediaQuery.of(context).size.height * .08),
          Padding(
            padding: EdgeInsets.only(
              right: MediaQuery.of(context).size.width * .05,
              left: MediaQuery.of(context).size.width * .05,
              bottom: MediaQuery.of(context).size.height * .02,
            ),
            child: Column(
              children: [
                ButtonWidget(
                  onPressed: () => context.go("/loading_logout_module"),
                  border: false,
                  text: "Sair",
                  colorText: ColorDefault.whiteColor,
                  colorButton: ColorDefault.primaryColor,
                  colorBorder: ColorDefault.primaryColor,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .08,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .02),
                ButtonWidget(
                  onPressed: () => UserDeleteServiceImp().deleteUser(context: context),
                  border: false,
                  text: "Apagar conta",
                  colorText: ColorDefault.whiteColor,
                  colorButton: ColorDefault.redColor,
                  colorBorder: ColorDefault.redColor,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .08,
                ),
              ],
            ),
          ),    
        ],
      ),
    );
  }
}