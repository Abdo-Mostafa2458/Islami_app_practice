import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:new_project/Theme/colors/app_colors.dart';
import 'package:new_project/design_app/Widgets_settings_tab/localization_language_widget.dart';
import 'package:new_project/design_app/Widgets_settings_tab/localization_theme_widget.dart';
import 'package:new_project/design_app/Widgets_settings_tab/settings_widget_interface.dart';
import 'package:new_project/provider/app_provider_notifier.dart';
import 'package:provider/provider.dart';

import '../../generated/locale_keys.g.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProviderNotifier>(context);

    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text("Languge App : ${context.locale.languageCode}"),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: SettingsWidgetInterface(
                  titleBottomSheet: LocaleKeys.Language.tr(),
                  onClicked: dropMenuLanguage,
                  bottomSheetColor: AppColorsLight.primaryColor,
                  bottomSheetHintText: context.locale.languageCode == "en"
                      ? LocaleKeys.English.tr()
                      : LocaleKeys.Arabic.tr()),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: SettingsWidgetInterface(
                  titleBottomSheet: LocaleKeys.Theme.tr(),
                  onClicked: dropMenuTheme,
                  bottomSheetColor: AppColorsLight.primaryColor,
                  bottomSheetHintText: provider.themeMode == ThemeMode.light
                      ? LocaleKeys.Light.tr()
                      : LocaleKeys.Dark.tr()),
            ),
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

  void dropMenuTheme() {
    showModalBottomSheet(
      context: context,
      builder: (context) => LocalizationThemeWidget(),
    );
  }
}
