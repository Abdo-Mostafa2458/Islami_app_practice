import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:new_project/Theme/colors/app_colors.dart';
import 'package:new_project/design_app/Widgets_settings_tab/localization_language_widget.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    void onChange() {
      print("onChange");
      if (context.locale.languageCode == "en") {
        context.setLocale(Locale('ar'));
      } else {
        context.setLocale(Locale("en"));
      }
    }

    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text("Languge App : ${context.locale.languageCode}"),
            Text("Language"),
            GestureDetector(
              onTap: () {
                dropMenuLanguage();
              },
              child: Container(
                height: 65,
                decoration: BoxDecoration(
                    color: AppColorsLight.primaryColor,
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Row(
                    children: [
                      Text("English"),
                      Spacer(),
                      Icon(
                        Icons.arrow_drop_down,
                        size: 35,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void dropMenuLanguage() {
    showModalBottomSheet(
      context: context,
      builder: (context) => LocalizationLanguageWidget(),
    );
  }
}
