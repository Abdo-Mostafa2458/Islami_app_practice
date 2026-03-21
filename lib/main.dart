import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:new_project/AppRoutes/AppRoutes.dart';
import 'package:new_project/Theme/app_theme.dart';
import 'package:new_project/design_app/Widgets_Hadeth_tab/hadeth_details.dart';
import 'package:new_project/design_app/Widgets_Quran_tab/quran_details.dart';
import 'package:new_project/design_app/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en'), Locale('ar')],
        path: 'assets/translations',
        // <-- change the path of the translation files
        fallbackLocale: Locale('ar'),
        child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appThemeLight,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routes: {
        AppRoutes.homeRoute: (context) => HomeScreen(),
        AppRoutes.quranDetails: (context) => QuranDetails(),
        AppRoutes.hadethDetails: (context) => HadethDetails(),
      },
      initialRoute: AppRoutes.homeRoute,
    );
  }
}
