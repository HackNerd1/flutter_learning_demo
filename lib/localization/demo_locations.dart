import 'package:flutter/material.dart';

class DemoLocalizations {
  DemoLocalizations(this.isZh);
  bool isZh = false;

  static DemoLocalizations of(BuildContext context) {
    return Localizations.of(context, DemoLocalizations);
  }

  String get title {
    return isZh ? "Flutter应用" : "Flutter APP";
  }
}
