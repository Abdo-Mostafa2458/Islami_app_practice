import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:new_project/AppRoutes/AppRoutes.dart';
import 'package:new_project/Theme/app_theme.dart';
import 'package:new_project/design_app/Widgets_Hadeth_tab/hadeth_details.dart';
import 'package:new_project/design_app/Widgets_Quran_tab/quran_details.dart';
import 'package:new_project/design_app/home_screen.dart';
import 'package:new_project/provider/app_provider_notifier.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en'), Locale('ar')],
        path: 'assets/translations',
        // <-- change the path of the translation files
        fallbackLocale: Locale('ar'),
        child: ChangeNotifierProvider(
            create: (context) => AppProviderNotifier(), child: MyApp())),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProviderNotifier>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appThemeLight,
      themeMode: provider.themeMode,
      darkTheme: AppTheme.appThemeDark,
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
