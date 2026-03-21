import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_project/AppRoutes/AppRoutes.dart';
import 'package:new_project/Theme/colors/app_colors.dart';
import 'package:new_project/design_app/Widgets_Quran_tab/custom_quran_body.dart';
import 'package:new_project/design_app/Widgets_Quran_tab/custom_quran_title.dart';
import 'package:new_project/design_app/Widgets_Quran_tab/quran_hader_image.dart';

class QuranTab extends StatefulWidget {
  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<String> Sura = [];
  List<String> verses = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        QuranHaderImage(),
        CustomQuranTitle(verse: "verse", surah: "sura"),
        Sura.isEmpty
            ? Center(
                heightFactor: 10,
                child: CircularProgressIndicator(
                  color: AppColorsLight.primaryColor,
                ))
            : Expanded(
                child: ListView.builder(
                  key: const PageStorageKey<String>("page"),
                  shrinkWrap: true,
                  physics: const RangeMaintainingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          print(index);

                          Navigator.pushNamed(context, AppRoutes.quranDetails,
                              arguments: QuranDetailsBottom(
                                  suraName: Sura[index], indexSura: index));
                        },
                        child: CustomQuranBody(
                            verse: verses[index], surah: Sura[index]));
                  },
                  itemCount: Sura.length,
                ),
        )

        // Container(
        //   height: 50,
        //   width: 4,
        //   margin: EdgeInsets.only(left: 3),
        //   color: AppColorsLight.primaryColor,
        // ),
      ],
    );
  }

  Future<void> loadData() async {
    String dataSura =
        await rootBundle.loadString("assets/files/qura_sura_name.txt");
    String dataVerses =
        await rootBundle.loadString("assets/files/verses_number.txt");
    verses = dataVerses.trim().split("\n");
    Sura = dataSura.trim().split("\n");
    setState(() {});
    // verses.add(dataVerses);
    // Sura.add(dataSura);
  }
}

class QuranDetailsBottom {
  String suraName;
  int indexSura;

  QuranDetailsBottom({required this.suraName, required this.indexSura});
}
