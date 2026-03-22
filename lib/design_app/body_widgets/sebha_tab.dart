import 'package:flutter/material.dart';
import 'package:new_project/Theme/colors/app_colors.dart';
import 'package:new_project/provider/app_provider_notifier.dart';
import 'package:provider/provider.dart';

class SebhaTab extends StatelessWidget {
  const SebhaTab({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProviderNotifier>(context);
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Stack(
            children: [
              GestureDetector(
                onTap: () {
                  provider.onSebhaClick();
                },
                child: Container(
                  margin: provider.isLight()
                      ? EdgeInsets.only(top: 38)
                      : EdgeInsets.only(top: 80),
                  child: AnimatedRotation(
                    turns: provider.sebhaTurns,
                    duration: const Duration(milliseconds: 200),
                    child: provider.isLight()
                        ? Image.asset(
                            "assets/images/body of seb7a_light.png",
                          )
                        : Image.asset(
                            "assets/images/body of seb7a_dark.png",
                          ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: provider.isLight() ? 140 : 100,
                child: provider.isLight()
                    ? Image.asset("assets/images/head of seb7a_light.png")
                    : Image.asset("assets/images/head of seb7a_dark.png"),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              "عدد التسبيحات",
              style: provider.isLight()
                  ? Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: AppColorsLight.blackColor)
                  : Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: AppColorsDark.whiteColor),
            ),
          ),
          Spacer(),
          Container(
            height: 90,
            width: 70,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: provider.isLight()
                  ? AppColorsLight.pageColor
                  : AppColorsDark.DarkColor,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Text(
              "${provider.sebhaCount}",
              style: provider.isLight()
                  ? Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: AppColorsLight.blackColor)
                  : Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: AppColorsDark.whiteColor),
            ),
          ),
          Spacer(),
          Container(
            width: 180,
            alignment: Alignment.center,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: provider.isLight()
                  ? AppColorsLight.primaryColor
                  : AppColorsDark.primaryGoldenColor,
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            child: Text(
              provider.azkar[provider.sebhaIndex],
              maxLines: 2,
              textAlign: TextAlign.center,
              style: provider.isLight()
                  ? Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: AppColorsLight.whiteColor)
                  : Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: AppColorsDark.blackColor),
            ),
          ),
          Spacer(flex: 5),
        ],
      ),
    );
  }
}
