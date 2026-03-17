import 'package:flutter/material.dart';

class QuranHaderImage extends StatelessWidget {
  const QuranHaderImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 100, vertical: 10),
        child: Image.asset("assets/images/quran_header_icn.png"));
  }
}
