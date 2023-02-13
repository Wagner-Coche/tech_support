import 'package:flutter/material.dart';

import '../../utils/color_default.dart';
import '../../utils/widgets/image_logo_app.dart';
import 'components/button_next_step_component.dart';
import 'components/text_description_component.dart';
import 'components/text_detail_component.dart';

class StepModule extends StatefulWidget {
  const StepModule({super.key});

  @override
  State<StepModule> createState() => _StepModuleState();
}

class _StepModuleState extends State<StepModule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorDefault.primaryColor,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .05),
                child: ImageLogoApp(
                  fontSize: MediaQuery.of(context).size.height * .02,
                  imageWidth: .1,
                  topPadding: .004,
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .01),
                child: Image.asset(
                  "assets/images/Call center-bro.png"
                )
              ),
            ]
          ),
          Container(
            height: MediaQuery.of(context).size.height * .45,
            decoration: BoxDecoration(
              color: ColorDefault.whiteColor,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(25),
                topLeft: Radius.circular(25),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const <Widget>[
                TextDescriptionComponent(),
                TextDetailComponent(),
                ButtonNextStepComponent(),
              ]
            ),
          ),
        ],
      ),
    );
  }
}

