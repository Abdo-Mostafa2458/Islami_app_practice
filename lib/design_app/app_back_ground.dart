import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:new_project/generated/locale_keys.g.dart';
import 'package:new_project/provider/app_provider_notifier.dart';
import 'package:provider/provider.dart';

class AppBackground extends StatelessWidget {
  final Widget? body;
  final Widget? bottomNavigationBar;

  const AppBackground({
    super.key,
    this.body,
    this.bottomNavigationBar,
  });

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProviderNotifier>(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: provider.isLight()
              ? AssetImage("assets/images/main_background.png")
              : AssetImage("assets/images/main_background_dark.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: provider.isLight() ? Colors.black : Colors.white,
          ),
          title: Text(
            LocaleKeys.title.tr(),
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        body: body,
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}
