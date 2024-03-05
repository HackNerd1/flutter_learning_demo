import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:learning_demo/localization/demo_locations.dart';
import 'package:learning_demo/localization/demo_locations_delegate.dart';

void main() {
  // debugPaintSizeEnabled = true;
  // debugPrintMarkNeedsLayoutStacks = true;
  // debugPrintMarkNeedsPaintStacks = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        DemoLocalizationsDelegate()
      ],
      locale: const Locale('zh'),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(DemoLocalizations.of(context).title),
          ),
        );
      },
    );
  }
}
