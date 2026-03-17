import 'package:flutter/material.dart';
import 'package:new_project/Theme/colors/app_colors.dart';
import 'package:new_project/design_app/body_widgets/hadeth_tab.dart';

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
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/main_background.png"),
              fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Islami",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
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
                  label: "quran",
                ),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/hadeth_ic.png")),
                    label: "hadeth"),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/sebha.png")),
                    label: "sebha"),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/radio.png")),
                    label: "radio"),
              ]),
        ),
      ),
    );
  }
}
