import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppProviderNotifier extends ChangeNotifier {
  List<String> Sura = [];
  List<String> verses = [];
  List<String> allHadeth = [];
  List<String> hadethTitle = [];
  double sebhaTurns = 0.0;
  int sebhaCount = 0;
  int sebhaIndex = 0;
  List<String> azkar = [
    "سبحان الله",
    "الحمدلله",
    "الله اكبر",
    "لا اله الا الله",
    "لا حول ولا قوة الا بالله",
    "اللهم صلي وسلم علي سيدنا محمد",
  ];
  bool isLoadingQuran = true;
  bool isLoadingHadeth = true;
  String app_language = 'en';
  ThemeMode themeMode = ThemeMode.light; //dark
  int selectedIndex = 0;

  void onSebhaClick() {
    sebhaTurns += 0.10;

    if (sebhaCount >= 33) {
      changeZekr();
    } else {
      sebhaCount++;
    }

    notifyListeners();
  }

  void changeZekr() {
    sebhaCount = 0;
    sebhaIndex++;

    if (sebhaIndex >= azkar.length) {
      sebhaIndex = 0;
    }
  }

  void change_language(String new_language) {
    if (app_language == 'en') {
      return;
    }
    app_language = new_language;
    notifyListeners();
  }

  void change_languageV2(BuildContext context) {
    if (context.locale.languageCode == "en") {
      context.setLocale(Locale("ar"));
    } else {
      context.setLocale(Locale("en"));
    }
    notifyListeners();
  }

  void changeThemeApp(ThemeMode newTheme) {
    if (themeMode == newTheme) return;

    themeMode = newTheme;
    notifyListeners();
  }

  void changeIndex(int newIndex) {
    selectedIndex = newIndex;
    notifyListeners();
  }

  Future<void> loadDataQuran() async {
    if (Sura.isNotEmpty) return;
    String dataSura =
        await rootBundle.loadString("assets/files/qura_sura_name.txt");
    String dataVerses =
        await rootBundle.loadString("assets/files/verses_number.txt");
    verses = dataVerses.trim().split("\n");
    Sura = dataSura.trim().split("\n");
    // verses.add(dataVerses);
    // Sura.add(dataSura);
    isLoadingQuran = false;
    notifyListeners();
  }

  Future<void> loadDataHadeth() async {
    if (allHadeth.isNotEmpty) return;
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
    isLoadingHadeth = false;

    notifyListeners();
  }

  bool isLight() {
    if (themeMode == ThemeMode.light) {
      return true;
    } else {
      return false;
    }
  }
}
