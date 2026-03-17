import 'package:flutter/material.dart';
import 'package:new_project/design_app/custom_quran_body.dart';
import 'package:new_project/design_app/custom_quran_title.dart';
import 'package:new_project/design_app/quran_hader_image.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        QuranHaderImage(),
        CustomQuranTitle(verse: "verse", surah: "surah"),
        CustomQuranBody(),
        CustomQuranBody(),
        CustomQuranBody(),
        CustomQuranBody(),
        CustomQuranBody(),
        CustomQuranBody(),
        CustomQuranBody(),
        CustomQuranBody(),
        CustomQuranBody(),
        CustomQuranBody(),
        CustomQuranBody(),

        // Container(
        //   height: 50,
        //   width: 4,
        //   margin: EdgeInsets.only(left: 3),
        //   color: AppColorsLight.primaryColor,
        // ),
      ],
    );
  }
}
