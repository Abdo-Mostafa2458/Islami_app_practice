import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:new_project/generated/locale_keys.g.dart';

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
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/main_background.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
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
