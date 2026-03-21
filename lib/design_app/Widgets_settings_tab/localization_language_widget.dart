import 'package:flutter/material.dart';
import 'package:new_project/Theme/colors/app_colors.dart';

class LocalizationLanguageWidget extends StatelessWidget {
  const LocalizationLanguageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              selectedItem();
            },
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Row(
                children: [
                  Text(
                    "English",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Spacer(),
                  Icon(
                    Icons.check_outlined,
                    color: AppColorsLight.primaryColor,
                    size: 40,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Row(
              children: [
                Text(
                  "Arabic",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Spacer(),
                Icon(
                  Icons.check_outlined,
                  color: AppColorsLight.primaryColor,
                  size: 40,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void selectedItem() {}
}
