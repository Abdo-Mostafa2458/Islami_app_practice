import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_project/AppRoutes/AppRoutes.dart';
import 'package:new_project/Theme/colors/app_colors.dart';
import 'package:new_project/generated/locale_keys.g.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<String> allHadeth = [];
  List<String> hadethTitle = [];

  @override
  void initState() {
    loadDataFile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Image.asset("assets/images/hadith_header_image.png"),
          Divider(
            color: AppColorsLight.primaryColor,
            height: 5,
            thickness: 5,
          ),
          Text(
            LocaleKeys.hadeth.tr(),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Divider(
            color: AppColorsLight.primaryColor,
            height: 5,
            thickness: 5,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      print(allHadeth);
                      Navigator.pushNamed(context, AppRoutes.hadethDetails,
                          arguments: HadethDetailsData(
                              Hadeth: allHadeth[index],
                              titleOfHadeth: hadethTitle[index]));
                    },
                    child: Column(
                      children: [
                        Text(
                          hadethTitle[index],
                          textAlign: TextAlign.center,
                        ),
                        Divider(
                          color: AppColorsLight.primaryColor,
                          height: 15,
                          thickness: 3,
                        )
                      ],
                    ));
              },
              itemCount: hadethTitle.length,
            ),
          )
        ],
      ),
    );
  }

  void loadDataFile() async {
    String data = await rootBundle.loadString("assets/files/ahadeth.txt");
    //
    allHadeth = data.trim().split("#");
    for (int i = 0; i < allHadeth.length; i++) {
      List<String> lines = allHadeth[i].trim().split('\n');
      String title = lines.removeAt(0);
      hadethTitle.add(title);
      String contant = lines.join("\n");
      allHadeth[i] = contant;
    }
    // for(int i=0;i<allHadeth.length;i++){
    //   List<String> lines=allHadeth[i].trim().split('\n');
    // }
    setState(() {});
  }
}

class HadethDetailsData {
  String titleOfHadeth;
  String Hadeth;

  HadethDetailsData({required this.Hadeth, required this.titleOfHadeth});
}
