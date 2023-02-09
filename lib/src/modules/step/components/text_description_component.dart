import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/color_default.dart';

class TextDescriptionComponent extends StatelessWidget {
  const TextDescriptionComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text(
        "Receive technical support, fast and simple",
        textAlign: TextAlign.center,
        style: GoogleFonts.righteous(
          fontSize: MediaQuery.of(context).size.height * .032,
          color: ColorDefault.primaryColor,
        )
      ),
    );
  }
}