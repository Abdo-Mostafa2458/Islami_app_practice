import 'package:flutter/cupertino.dart';

double getWith(double width, BuildContext context) {
  return MediaQuery.sizeOf(context).width * width;
}

double getHeight(double height, BuildContext context) {
  return MediaQuery.sizeOf(context).height * height;
}
