import 'package:flutter/material.dart';
import 'package:new_project/provider/app_provider_notifier.dart';
import 'package:provider/provider.dart';

import '../../Theme/colors/app_colors.dart';

class CustomQuranTitle extends StatelessWidget {
  String verse;
  String surah;

  CustomQuranTitle({required this.surah, required this.verse});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProviderNotifier>(context);
    return Stack(
      children: [
        Positioned(
          left: 205,
          child: Container(
            height: 60,
            width: 4,
            color: provider.isLight()
                ? AppColorsLight.primaryColor
                : AppColorsDark.primaryGoldenColor,
          ),
        ),
        Column(
          children: [
            Divider(
              color: provider.isLight()
                  ? AppColorsLight.primaryColor
                  : AppColorsDark.primaryGoldenColor,
              thickness: 3,
              height: 3,
            ),
            Container(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                textDirection:
                    provider.isLight() ? TextDirection.rtl : TextDirection.ltr,
                children: [
                  Text(
                    verse,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    surah,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            Divider(
              color: provider.isLight()
                  ? AppColorsLight.primaryColor
                  : AppColorsDark.primaryGoldenColor,
              thickness: 3,
              height: 3,
            ),
          ],
        ),
      ],
    );
  }
}
