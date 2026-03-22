import 'package:flutter/material.dart';

typedef bottomSheet = void Function();

class SettingsWidgetInterface extends StatelessWidget {
  String titleBottomSheet;
  bottomSheet onClicked;
  Color bottomSheetColor;
  String bottomSheetHintText;

  SettingsWidgetInterface(
      {required this.titleBottomSheet,
      required this.onClicked,
      required this.bottomSheetColor,
      required this.bottomSheetHintText});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(titleBottomSheet),
        GestureDetector(
          onTap: onClicked,
          child: Container(
            height: 65,
            decoration: BoxDecoration(
                color: bottomSheetColor,
                borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Row(
                children: [
                  Text(bottomSheetHintText),
                  Spacer(),
                  Icon(
                    Icons.arrow_drop_down,
                    size: 35,
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
