import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:new_project/AppRoutes/AppRoutes.dart';
import 'package:new_project/Theme/colors/app_colors.dart';
import 'package:new_project/generated/locale_keys.g.dart';
import 'package:new_project/provider/app_provider_notifier.dart';
import 'package:provider/provider.dart';

class HadethTab extends StatelessWidget {
  // List<String> allHadeth = [];
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProviderNotifier>(context);
    if (provider.allHadeth.isEmpty && provider.isLoadingHadeth) {
      provider.loadDataHadeth();
    }
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Image.asset("assets/images/hadith_header_image.png"),
          Divider(
            color: provider.isLight()
                ? AppColorsLight.primaryColor
                : AppColorsDark.primaryGoldenColor,
            height: 5,
            thickness: 5,
          ),
          Text(
            LocaleKeys.hadeth.tr(),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Divider(
            color: provider.isLight()
                ? AppColorsLight.primaryColor
                : AppColorsDark.primaryGoldenColor,
            height: 5,
            thickness: 5,
          ),
          provider.allHadeth.isEmpty
              ? Center(
                  heightFactor: 10,
                  child: CircularProgressIndicator(
                    color: provider.isLight()
                        ? AppColorsLight.primaryColor
                        : AppColorsDark.primaryGoldenColor,
                  ))
              : Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, AppRoutes.hadethDetails,
                                arguments: HadethDetailsData(
                                    Hadeth: provider.allHadeth[index],
                                    titleOfHadeth:
                                        provider.hadethTitle[index]));
                          },
                          child: Column(
                            children: [
                              Text(
                                provider.hadethTitle[index],
                                textAlign: TextAlign.center,
                              ),
                              Divider(
                                color: provider.isLight()
                                    ? AppColorsLight.primaryColor
                                    : AppColorsDark.primaryGoldenColor,
                                height: 15,
                                thickness: 3,
                              )
                            ],
                          ));
                    },
                    itemCount: provider.hadethTitle.length,
                  ),
                )
        ],
      ),
    );
  }
}

class HadethDetailsData {
  String titleOfHadeth;
  String Hadeth;

  HadethDetailsData({required this.Hadeth, required this.titleOfHadeth});
}
