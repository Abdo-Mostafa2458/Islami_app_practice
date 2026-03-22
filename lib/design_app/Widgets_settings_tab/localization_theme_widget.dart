import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:new_project/Theme/colors/app_colors.dart';
import 'package:new_project/generated/locale_keys.g.dart';
import 'package:new_project/provider/app_provider_notifier.dart';
import 'package:provider/provider.dart';

class LocalizationThemeWidget extends StatelessWidget {
  const LocalizationThemeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProviderNotifier>(context);

    return Container(
      color: provider.isLight()
          ? AppColorsLight.whiteColor
          : AppColorsDark.DarkColor,
      width: double.infinity,
      child: Column(
        children: [
          GestureDetector(
              onTap: () {
                provider.changeThemeApp(ThemeMode.light);
              },
              child: provider.themeMode == ThemeMode.light
                  ? selectedItemTheme(context, LocaleKeys.Light.tr())
                  : UnSelectedItemTheme(context, LocaleKeys.Light.tr())),
          GestureDetector(
              onTap: () {
                provider.changeThemeApp(ThemeMode.dark);
              },
              child: provider.themeMode == ThemeMode.dark
                  ? selectedItemTheme(context, LocaleKeys.Dark.tr())
                  : UnSelectedItemTheme(context, LocaleKeys.Dark.tr())),
          // UnselectedItem(context),
        ],
      ),
    );
  }
}

Widget selectedItemTheme(BuildContext context, String text) {
  return Padding(
    padding: const EdgeInsets.all(14.0),
    child: Row(
      children: [
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: AppColorsLight.primaryColor),
        ),
        Spacer(),
        Icon(
          Icons.check_outlined,
          color: AppColorsLight.primaryColor,
          size: 40,
        )
      ],
    ),
  );
}

Widget UnSelectedItemTheme(BuildContext context, String text) {
  return Padding(
    padding: const EdgeInsets.all(14.0),
    child: Row(
      children: [
        Text(text, style: Theme.of(context).textTheme.bodyMedium),
      ],
    ),
  );
}
