import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:new_project/Theme/colors/app_colors.dart';
import 'package:new_project/provider/app_provider_notifier.dart';
import 'package:provider/provider.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProviderNotifier>(context);
    return Column(
      children: [
        Spacer(
          flex: 2,
        ),
        Image.asset(
          "assets/images/radio_vector.png",
          fit: BoxFit.cover,
        ),
        Spacer(
          flex: 1,
        ),
        Text(
          "أذاعة القرأن الكريم",
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(fontWeight: FontWeight.w900),
        ),
        Spacer(
          flex: 1,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                context.locale.languageCode == "en"
                    ? Icons.skip_previous
                    : Icons.skip_next,
                color: provider.isLight()
                    ? AppColorsLight.primaryColor
                    : AppColorsDark.primaryGoldenColor,
                size: 40,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                context.locale.languageCode == "en"
                    ? Icons.arrow_right_rounded
                    : Icons.arrow_left_rounded,
                color: provider.isLight()
                    ? AppColorsLight.primaryColor
                    : AppColorsDark.primaryGoldenColor,
                size: 100,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                context.locale.languageCode == "en"
                    ? Icons.skip_next
                    : Icons.skip_previous,
                color: provider.isLight()
                    ? AppColorsLight.primaryColor
                    : AppColorsDark.primaryGoldenColor,
                size: 40,
              ),
            ),
          ],
        ),
        Spacer(
          flex: 2,
        ),
      ],
    );
  }
}
