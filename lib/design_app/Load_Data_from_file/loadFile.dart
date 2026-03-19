import 'package:flutter/services.dart';

class loadFileData {
  static Future<void> loadDataSura(List<String> Sura) async {
    String data =
        await rootBundle.loadString("assets/files/qura_sura_name.txt");
    Sura.add(data);
  }

  static Future<void> loadDataVerses(List<String> verses) async {
    String data = await rootBundle.loadString("assets/files/verses_number.txt");
    verses.add(data);
  }
}
