import 'package:flutter/material.dart';
import 'package:new_project/Theme/colors/app_colors.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  double turns = 0.0;
  int index = 0;
  int increment = 0;
  int indexAzkar = 0;
  List<String> Azkar = [
    "سبحان الله",
    "الحمدلله",
    "الله اكبر",
    "لا اله الا الله",
    "لا حول ولا قوة الا بالله",
    "اللهم صلي وسلم علي سيدنا محمد",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Stack(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    turns += 0.10;
                    onClicked();
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(top: 38),
                  child: AnimatedRotation(
                    turns: turns,
                    duration: const Duration(milliseconds: 200),
                    child: Image.asset(
                      "assets/images/body of seb7a_light.png",
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 150,
                child: Image.asset("assets/images/head of seb7a_light.png"),
              ),
            ],
          ),
          Text(
            "عدد التسبيحات",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Spacer(
            flex: 1,
          ),
          Container(
            height: 90,
            width: 70,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: AppColorsLight.pageColor,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Text(
              "$index",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Spacer(
            flex: 1,
          ),
          Container(
            width: 180,
            alignment: Alignment.center,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: AppColorsLight.primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(50))),
            child: Text(
              Azkar[indexAzkar],
              maxLines: 2,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Colors.white),
            ),
          ),
          Spacer(
            flex: 5,
          ),
        ],
      ),
    );
  }

  void onClicked() {
    print("object$index");
    if (index >= 33) {
      onChangeZker();
    } else {
      index++;
    }
    setState(() {});
  }

  void onChangeZker() {
    increment++;
    index = 0;
    for (int i = 0; i < Azkar.length; i++) {
      if (increment == i) {
        indexAzkar = i;
        break;
      }
    }
    if (increment >= Azkar.length) {
      increment = 0;
    }
    indexAzkar = increment;
  }
}
