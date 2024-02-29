import 'dart:async';

import 'package:flutter/services.dart';

Future<String> loadAssest() async {
  return await rootBundle.loadString('assets');
}
