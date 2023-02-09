import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonComponent extends StatelessWidget {
  const ButtonComponent({
    super.key, 
    required this.border, 
    required this.text, 
    required this.colorText, 
    required this.colorButton,
    required this.colorBorder,
    required this.onPressed, 
    required this.width, 
    required this.height,
    this.icon = false
  });

  final bool icon;
  final bool border;
  final String text;
  final double width;
  final double height;
  final Color? colorText;
  final Color colorBorder;
  final Color? colorButton;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: colorButton,
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            side: BorderSide(
              color: colorBorder,
              width: 2,
            )
          ),
        ),
        child: icon ? Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/google.png",
              width: MediaQuery.of(context).size.width * .08,
            ),
            SizedBox(width: MediaQuery.of(context).size.width * .04),
            Text(
              text,
              style: GoogleFonts.righteous(
                fontSize: MediaQuery.of(context).size.height * .02,
                color: colorText,
              )
            ),
          ],
        ) : Text(
          text,
          style: GoogleFonts.righteous(
            fontSize: MediaQuery.of(context).size.height * .02,
            color: colorText,
          )
        )
      )
    );
  }
}