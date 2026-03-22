import 'package:flutter/material.dart';
import 'package:new_project/design_app/app_back_ground.dart';
import 'package:new_project/design_app/resable_data_details_widget.dart';
import 'package:new_project/provider/app_provider_notifier.dart';
import 'package:provider/provider.dart';

import '../../Theme/colors/app_colors.dart';
import '../body_widgets/hadeth_tab.dart';

class HadethDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProviderNotifier>(context);
    final HadethDetailsData argsHadeth =
        ModalRoute.of(context)!.settings.arguments as HadethDetailsData;

    return AppBackground(
      body: ResableDataDetailsWidget(
        widgetOnCard: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 5),
          child: Column(
            children: [
              Text(
                  // "${argsHadeth}",
                  "${argsHadeth.titleOfHadeth}",
                  textAlign: TextAlign.center,
                  style: provider.isLight()
                      ? Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: AppColorsLight.blackColor)
                      : Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: AppColorsLight.whiteColor)),
              Divider(
                color: provider.isLight()
                    ? AppColorsLight.primaryColor
                    : AppColorsDark.primaryGoldenColor,
                thickness: 2,
                endIndent: 30,
                indent: 30,
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    print(index);
                    return Text(
                      "${argsHadeth.Hadeth}",
                      textAlign: TextAlign.center,
                    );
                  },
                  itemCount: 1,
                  scrollDirection: Axis.vertical,
                ),
              )
            ],
          ),
        ),
        colorCard: provider.isLight()
            ? AppColorsLight.whiteColor
            : AppColorsDark.DarkColor,
      ),
    );
  }
}
