import 'package:flutter/material.dart';

//the Layouts class provides static methods for getting the current theme and screen size in a Flutter app.
//By making these methods static, they can be accessed from anywhere in the app without needing to create an
// instance of the Layouts class. This can make it easier to reuse these methods throughout the app.
class Layouts {
  static getTheme(BuildContext context) {
    return Theme.of(context);
  }
  static getSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

}