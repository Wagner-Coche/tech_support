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
        "e-Support, is a technological solution that helps or supports the other technical problems",
        textAlign: TextAlign.center,
        style: GoogleFonts.aBeeZee(
          fontSize: 18,
          color: ColorDefault.greyColor,
          fontWeight: FontWeight.bold,
        )
      ),
    );
  }
}