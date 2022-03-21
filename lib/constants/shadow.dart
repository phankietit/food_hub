import 'package:flutter/material.dart';
import 'package:food_hub/constants/colors.dart';

class AppShadow {
  static const List<BoxShadow> button = [
    BoxShadow(
      color: Colors.white10,
      blurRadius: 10,
      offset: Offset(3, 6), // changes position of shadow
    ),
  ];
}
