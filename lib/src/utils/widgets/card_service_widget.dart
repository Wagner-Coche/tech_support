import 'package:flutter/material.dart';

import '../color_default.dart';

class CardServiceWidget extends StatelessWidget {
  const CardServiceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * .15,
          width: MediaQuery.of(context).size.width * .37,
          decoration: BoxDecoration(
            color: ColorDefault.primaryColor.withOpacity(.2),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(
              color: ColorDefault.primaryColor,
              width: 2,
            ),
          ),
          child: Center(
            child: Icon(
              Icons.favorite, 
              color: ColorDefault.blackColor, 
              size: MediaQuery.of(context).size.height * .06
            )
          ),
        ),
        // SizedBox(width: MediaQuery.of(context).size.width * .04),
        // Container(
        //   height: MediaQuery.of(context).size.height * .18,
        //   width: MediaQuery.of(context).size.width * .4,
        //   decoration: BoxDecoration(
        //     color: ColorDefault.primaryColor.withOpacity(.2),
        //     borderRadius: const BorderRadius.all(Radius.circular(10)),
        //     border: Border.all(
        //       color: ColorDefault.primaryColor,
        //       width: 2,
        //     ),
        //   ),
        //   child: Center(
        //     child: Icon(
        //       Icons.favorite, 
        //       color: ColorDefault.blackColor, 
        //       size: MediaQuery.of(context).size.height * .06
        //     )
        //   ),
        // ),
      ],
    );
  }
}