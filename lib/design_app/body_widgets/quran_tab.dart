import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:new_project/AppRoutes/AppRoutes.dart';
import 'package:new_project/Theme/colors/app_colors.dart';
import 'package:new_project/design_app/Widgets_Quran_tab/custom_quran_body.dart';
import 'package:new_project/design_app/Widgets_Quran_tab/custom_quran_title.dart';
import 'package:new_project/design_app/Widgets_Quran_tab/quran_hader_image.dart';
import 'package:new_project/generated/locale_keys.g.dart';
import 'package:new_project/provider/app_provider_notifier.dart';
import 'package:provider/provider.dart';

class QuranTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProviderNotifier>(context);
    if (provider.Sura.isEmpty && provider.isLoadingQuran) {
      provider.loadDataQuran();
    }
    return Column(
      children: [
        QuranHaderImage(),
        CustomQuranTitle(
            verse: LocaleKeys.verses.tr(), surah: LocaleKeys.sura.tr()),
        provider.Sura.isEmpty
            ? Center(
                heightFactor: 10,
                child: CircularProgressIndicator(
                  color: provider.isLight()
                      ? AppColorsLight.primaryColor
                      : AppColorsDark.primaryGoldenColor,
                ))
            : Expanded(
                child: ListView.builder(
                  key: const PageStorageKey<String>("page"),
                  shrinkWrap: true,
            physics: const RangeMaintainingScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, AppRoutes.quranDetails,
                              arguments: QuranDetailsBottom(
                                  suraName: provider.Sura[index],
                                  indexSura: index));
                        },
                        child: CustomQuranBody(
                            verse: provider.verses[index],
                            surah: provider.Sura[index]));
                  },
                  itemCount: provider.Sura.length,
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
}

class QuranDetailsBottom {
  String suraName;
  int indexSura;

  QuranDetailsBottom({required this.suraName, required this.indexSura});
}
