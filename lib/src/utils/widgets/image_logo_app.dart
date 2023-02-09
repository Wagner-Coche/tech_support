import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/color_default.dart';

class ImageLogoApp extends StatelessWidget {
  const ImageLogoApp({
    super.key, 
    required this.fontSize,
    required this.imageWidth, 
    required this.topPadding, 
  });

  final double fontSize;
  final double imageWidth;
  final double topPadding;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/esupport.png",
            width: MediaQuery.of(context).size.width * imageWidth,
          ),
          Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * topPadding, 
              left: MediaQuery.of(context).size.width * .01
            ),
            child: Text(
              "SUPPORT",
              style: GoogleFonts.righteous(
                fontSize: fontSize,
                color: ColorDefault.whiteColor,
                fontWeight: FontWeight.bold
              )
            ),
          )
        ],
      ),
    );
  }
}