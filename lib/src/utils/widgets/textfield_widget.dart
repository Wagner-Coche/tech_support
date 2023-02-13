import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:e_support/src/utils/color_default.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key, 
    required this.title, 
    required this.obscureText, 
    required this.keyBoardType, 
    required this.validator,
    required this.controller,
    this.suffixIcon, 
  });

  final String title;
  final Icon? suffixIcon;
  final bool obscureText;
  final TextInputType keyBoardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * .004,
            bottom: MediaQuery.of(context).size.height * .01
          ),
          child: Text(
            title,
            style: GoogleFonts.righteous(
              fontSize: MediaQuery.of(context).size.height * .018,
              color: ColorDefault.blackColor.withOpacity(.65)
            )
          ),
        ),
        TextFormField(
          validator: validator,
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyBoardType,
          cursorColor: ColorDefault.blackColor.withOpacity(.65),
          decoration: InputDecoration(
            filled: true,
            fillColor: ColorDefault.greyOtherColor.withOpacity(.3), 
            suffixIcon: suffixIcon,           
            border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                color: ColorDefault.greyOtherColor.withOpacity(.3)
              )
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                color: ColorDefault.greyOtherColor.withOpacity(.3)
              )
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                color: ColorDefault.primaryColor,
                width: 2
              )
            ),
          ),
        )
      ],
    );
  }
}