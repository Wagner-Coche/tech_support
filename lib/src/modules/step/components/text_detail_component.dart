import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/color_default.dart';

class TextDetailComponent extends StatelessWidget {
  const TextDetailComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * .02),
      child: Text(
        "e-Support é uma solução tecnológica que auxilia ou ajuda você nos seus problemas técnicos",
        textAlign: TextAlign.center,
        style: GoogleFonts.righteous(
          fontSize: MediaQuery.of(context).size.height * .023,
          color: ColorDefault.greyOtherColor,
        )
      ),
    );
  }
}