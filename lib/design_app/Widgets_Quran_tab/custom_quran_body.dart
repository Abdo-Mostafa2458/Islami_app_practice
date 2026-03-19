import 'package:flutter/material.dart';

import '../../Theme/colors/app_colors.dart';

class CustomQuranBody extends StatelessWidget {
  String verse;
  String surah;

  CustomQuranBody({required this.surah, required this.verse});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 205,
          child: Container(
            height: 50,
            width: 4,
            color: AppColorsLight.primaryColor,
          ),
        ),
        Column(
          children: [
            Container(
              height: 50,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      verse,
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      surah,
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: AppColorsLight.primaryColor,
              thickness: 3,
              height: 3,
            ),
          ],
        ),
      ],
    );
  }
}
