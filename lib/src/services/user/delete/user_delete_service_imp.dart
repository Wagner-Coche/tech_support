import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:e_support/src/services/user/delete/user_delete_service.dart';
import 'package:go_router/go_router.dart';

import '../../../utils/color_default.dart';

class UserDeleteServiceImp implements UserDeleteService {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future<bool> deleteUser({required BuildContext context}) async {
    try {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: SizedBox(
              height: MediaQuery.of(context).size.height * .18,
              child: Column(
                children: <Widget>[
                  Text(
                    "Tem certeza que deseja apagar esta conta?",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * .024,
                      fontFamily: "TiltWarp",
                      color: ColorDefault.blackColor,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * .033),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .06,
                        width: MediaQuery.of(context).size.width * .2,
                        child: InkWell(
                          onTap: () => context.go("/home_module/profile_user"),
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          child: Center(
                            child: Text(
                              "Cancelar",
                              style: TextStyle(
                                fontSize: MediaQuery.of(context).size.height * .02,
                                fontFamily: "TiltWarp",
                                color: ColorDefault.blackColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * .02),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .06,
                        width: MediaQuery.of(context).size.width * .2,
                        child: InkWell(
                          onTap: () => context.go("/check_register"),
                          highlightColor: ColorDefault.redColor,
                          hoverColor: ColorDefault.redColor,
                          splashColor: ColorDefault.redColor,
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          child: Center(
                            child: Text(
                              "Apagar",
                              style: TextStyle(
                                fontSize: MediaQuery.of(context).size.height * .02,
                                fontFamily: "TiltWarp",
                                color: ColorDefault.blackColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]
                  )
                ]
              ),
            ),
          );
        }
      );
      return true;
    } on FirebaseAuthException catch (e) {
      debugPrint("Error: $e");
      return false;
    }
  }
}