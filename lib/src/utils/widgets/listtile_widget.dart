import 'package:flutter/material.dart';

import '../color_default.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({
    super.key, 
    required this.title,  
    required this.onTap, 
    required this.trailing, 
    this.selectedColor, 
    this.leading, 
    this.subTitle, 
    this.hoverColor,
  });

  final String title;
  final Widget? leading;
  final VoidCallback onTap;
  final Widget? trailing;
  final String? subTitle;
  final Color? selectedColor;
  final Color? hoverColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.height * .015,
          fontFamily: "TiltWarp",
          color: ColorDefault.blackColor,
        ),        
      ),
      leading: leading,
      trailing: trailing,
      selectedColor: selectedColor,
      onTap: onTap,
      hoverColor: hoverColor
    );
  }
}