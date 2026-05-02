import 'package:flutter/widgets.dart';

//  abstract class to hold all the styles in the app and make it easier to change them in the future
//  use absract class to prevent instantiation and make it clear that this class is only for holding styles
abstract class Styles {
  static const textSizemedium = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );
}
