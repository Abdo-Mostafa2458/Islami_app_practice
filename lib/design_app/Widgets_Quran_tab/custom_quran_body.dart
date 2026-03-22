import 'package:flutter/material.dart';
import 'package:new_project/provider/app_provider_notifier.dart';
import 'package:provider/provider.dart';

import '../../Theme/colors/app_colors.dart';

class CustomQuranBody extends StatelessWidget {
  String verse;
  String surah;

  CustomQuranBody({required this.surah, required this.verse});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProviderNotifier>(context);
    return Stack(
      children: [
        Positioned(
          left: 205,
          child: Container(
            height: 50,
            width: 4,
            color: provider.isLight()
                ? AppColorsLight.primaryColor
                : AppColorsDark.primaryGoldenColor,
          ),
        ),
        Column(
          children: [
            Container(
              height: 50,
              child: Row(
                textDirection:
                    provider.isLight() ? TextDirection.rtl : TextDirection.ltr,
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
