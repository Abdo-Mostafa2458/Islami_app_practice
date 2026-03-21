import 'package:flutter/material.dart';

class ResableDataDetailsWidget extends StatelessWidget {
  Color colorCard;
  Widget widgetOnCard;

  ResableDataDetailsWidget({
    required this.widgetOnCard,
    this.colorCard = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      margin: EdgeInsets.only(right: 40, left: 40, top: 20, bottom: 150),
      child: Card(
        color: colorCard,
        child: widgetOnCard,
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
