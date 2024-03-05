import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:learning_demo/localization/demo_locations.dart';

class DemoLocalizationsDelegate
    extends LocalizationsDelegate<DemoLocalizations> {
  @override
  bool isSupported(Locale locale) {
    return ['en', 'zh'].contains(locale.languageCode);
  }

  @override
  Future<DemoLocalizations> load(Locale locale) {
    print("$locale");
    return SynchronousFuture(DemoLocalizations(locale.languageCode == "zh"));
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<DemoLocalizations> old) {
    return false;
  }
}
