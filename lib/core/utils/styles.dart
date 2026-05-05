import 'package:bookly_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

//  abstract class to hold all the styles in the app and make it easier to change them in the future
//  use absract class to prevent instantiation and make it clear that this class is only for holding styles
abstract class Styles {
  static const textSize18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static const textStyle20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.normal,
    fontFamily: kanotherfontFamily,
  );

  static const textStyle30 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.normal,
    fontFamily: kanotherfontFamily,
  );

  static const textStyle14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );

  static const textStyle16 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
}
