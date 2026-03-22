import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_project/Theme/colors/app_colors.dart';
import 'package:new_project/design_app/app_back_ground.dart';
import 'package:new_project/design_app/resable_data_details_widget.dart';
import 'package:new_project/provider/app_provider_notifier.dart';
import 'package:provider/provider.dart';

import '../body_widgets/quran_tab.dart';

class QuranDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProviderNotifier>(context);
    final QuranDetailsBottom args =
        ModalRoute.of(context)!.settings.arguments as QuranDetailsBottom;
    return AppBackground(
      body: FutureBuilder<List<String>>(
          future: loadQuranData(args.indexSura),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                heightFactor: 10,
                child: CircularProgressIndicator(
                  color: AppColorsLight.primaryColor,
                ),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text("Error loading data"),
              );
            }
            List<String> AyatSura = snapshot.data!;

            return ResableDataDetailsWidget(
              widgetOnCard: Padding(
                padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 2),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      textDirection: TextDirection.ltr,
                      children: [
                        Container(
                            margin: EdgeInsets.only(left: 60),
                            child: Text("سورة ${args.suraName}",
                                textAlign: TextAlign.center,
                                style: provider.isLight()
                                    ? Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                            color: AppColorsLight.blackColor)
                                    : Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                            color: AppColorsLight.whiteColor))),
                        Container(
                          margin: EdgeInsets.only(right: 30),
                          child: CircleAvatar(
                              backgroundColor: provider.isLight()
                                  ? AppColorsLight.blackColor
                                  : AppColorsDark.primaryGoldenColor,
                              radius: 15,
                              child: Icon(
                                Icons.play_arrow,
                                color: provider.isLight()
                                    ? AppColorsLight.whiteColor
                                    : AppColorsDark.blackColor,
                                size: 30,
                              )),
                        ),
                      ],
                    ),
                    Divider(
                      color: provider.isLight()
                          ? AppColorsLight.primaryColor
                          : AppColorsDark.primaryGoldenColor,
                      thickness: 2,
                      endIndent: 30,
                      indent: 30,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return Text(
                              textDirection: TextDirection.rtl,
                              "${AyatSura[index]}(${index + 1})",
                              textAlign: TextAlign.center,
                              style: provider.isLight()
                                  ? Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          color: AppColorsLight.blackColor)
                                  : Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          color: AppColorsLight.whiteColor));
                        },
                        itemCount: AyatSura.length,
                        scrollDirection: Axis.vertical,
                      ),
                    )
                  ],
                ),
              ),
              colorCard: provider.isLight()
                  ? AppColorsLight.whiteColor
                  : AppColorsDark.DarkColor,
            );
          }),
    );
  }
}

Future<List<String>> loadQuranData(int index) async {
  String quran = await rootBundle.loadString("assets/files/${index + 1}.txt");
  return quran.trim().split("\n");
}
