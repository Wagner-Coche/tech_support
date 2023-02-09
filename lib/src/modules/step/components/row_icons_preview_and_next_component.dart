import 'package:flutter/material.dart';

import '../../../utils/color_default.dart';

class RowIconsPreviewAndNextComponent extends StatelessWidget {
  const RowIconsPreviewAndNextComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .015),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * .42),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * .015,
              width: MediaQuery.of(context).size.width * .03,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorDefault.primaryColor,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))
                  )
                ), 
                child: const Text(""),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .015,
              width: MediaQuery.of(context).size.width * .03,
              child: ElevatedButton(
                onPressed: () {}, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorDefault.greyOtherColor,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))
                  )
                ), 
                child: const Text(""),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .015,
              width: MediaQuery.of(context).size.width * .03,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorDefault.greyOtherColor,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))
                  )
                ), 
                child: const Text(""), 
              ),
            ),
          ],
        ),
      ),
    );
  }
}