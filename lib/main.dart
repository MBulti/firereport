import 'package:firereport/pages/pages.dart';
import 'package:firereport/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'FireReport',
      debugShowCheckedModeBanner: false,
      theme: getLightTheme(),
      darkTheme: getDarkTheme(),
      themeMode: ThemeMode.system,
      locale: const Locale("de", "DE"),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
      ],
      initialRoute: "/",
      home: const DefectReportListPage(),
    );
  }
}
