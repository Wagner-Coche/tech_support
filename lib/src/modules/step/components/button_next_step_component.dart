import 'package:flutter/material.dart';

import '../../../utils/color_default.dart';

class ButtonNextStepComponent extends StatelessWidget {
  const ButtonNextStepComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .07,
      width: MediaQuery.of(context).size.width * .17,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorDefault.primaryColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50))
          ),
        ),
        child: Center(
          child: Icon(
            Icons.arrow_forward_rounded,
            color: ColorDefault.whiteColor,
          ),
        )
      ),
    );
  }
}