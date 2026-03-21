import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:new_project/Theme/colors/app_colors.dart';
import 'package:new_project/design_app/app_back_ground.dart';
import 'package:new_project/design_app/body_widgets/hadeth_tab.dart';
import 'package:new_project/design_app/body_widgets/settings_tab.dart';

import '../generated/locale_keys.g.dart';
import 'body_widgets/quran_tab.dart';
import 'body_widgets/radio_tab.dart';
import 'body_widgets/sebha_tab.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    SettingsTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return AppBackground(
        body: tabs[selectedIndex],
        bottomNavigationBar: Theme(
          data: Theme.of(context)
              .copyWith(canvasColor: AppColorsLight.primaryColor),
          child: BottomNavigationBar(
            // unselectedIconTheme: Theme.of(context).primaryColor,
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              currentIndex: selectedIndex,
              items: [
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/quran.png")),
                  label: LocaleKeys.quran.tr(),
                ),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/hadeth_ic.png")),
                    label: LocaleKeys.hadeth.tr()),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/sebha.png")),
                    label: LocaleKeys.sebha.tr()),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/radio.png")),
                    label: LocaleKeys.radio.tr()),
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Icon(
                        Icons.settings,
                        size: 30,
                      ),
                    ),
                    label: LocaleKeys.settings.tr()),
              ]),
        ));
  }
}
