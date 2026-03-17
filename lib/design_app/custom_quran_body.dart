import 'package:flutter/material.dart';

import '../Theme/colors/app_colors.dart';

class CustomQuranBody extends StatelessWidget {
  const CustomQuranBody({super.key});

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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "verse",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    "surah",
                    style: Theme.of(context).textTheme.bodyMedium,
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
