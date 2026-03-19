import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_project/Theme/colors/app_colors.dart';
import 'package:new_project/design_app/app_back_ground.dart';

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
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text("Error loading data"),
              );
            }
            List<String> AyatSura = snapshot.data!;

            return Container(
              height: double.infinity,
              width: double.infinity,
              margin:
                  EdgeInsets.only(right: 40, left: 40, top: 20, bottom: 150),
              child: Card(
                color: AppColorsLight.whiteColor,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30.0, horizontal: 5),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                        endIndent: 30,
                        indent: 30,
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return Text(
                              "${AyatSura[index]}",
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
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
            );
          }),
    );
  }
}

Future<List<String>> loadQuranData(int index) async {
  String quran = await rootBundle.loadString("assets/files/${index + 1}.txt");
  return quran.trim().split("\n");
}
