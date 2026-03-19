import 'package:flutter/material.dart';
import 'package:new_project/Theme/colors/app_colors.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
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
                Icons.skip_previous,
                color: AppColorsLight.primaryColor,
                size: 40,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_right_rounded,
                color: AppColorsLight.primaryColor,
                size: 100,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.skip_next,
                color: AppColorsLight.primaryColor,
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
