import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_project/Theme/colors/app_colors.dart';
import 'package:new_project/design_app/app_back_ground.dart';
import 'package:new_project/design_app/resable_data_details_widget.dart';

import '../body_widgets/quran_tab.dart';

class QuranDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 5),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      textDirection: TextDirection.ltr,
                      children: [
                        Container(
                            margin: EdgeInsets.only(left: 100),
                            child: Text(
                              args.suraName,
                              textAlign: TextAlign.center,
                            )),
                        Container(
                          margin: EdgeInsets.only(right: 50),
                          child: CircleAvatar(
                              backgroundColor: AppColorsLight.blackColor,
                              radius: 15,
                              child: Icon(
                                Icons.play_arrow,
                                color: Colors.white,
                                size: 30,
                              )),
                        ),
                      ],
                    ),
                    Divider(
                      color: AppColorsLight.primaryColor,
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
                          );
                        },
                        itemCount: AyatSura.length,
                        scrollDirection: Axis.vertical,
                      ),
                    )
                  ],
                ),
              ),
              colorCard: AppColorsLight.whiteColor,
            );
          }),
    );
  }
}

Future<List<String>> loadQuranData(int index) async {
  String quran = await rootBundle.loadString("assets/files/${index + 1}.txt");
  return quran.trim().split("\n");
}
