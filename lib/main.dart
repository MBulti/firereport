import 'package:firereport/pages/pages.dart';
import 'package:firereport/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/route_manager.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: "https://gtjwpkqnehchegvxesva.supabase.co",
    anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imd0andwa3FuZWhjaGVndnhlc3ZhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjM1Mzg0OTYsImV4cCI6MjAzOTExNDQ5Nn0.7ZAHS7OOwcJy3ooTwhMVKhgbih6bLYvSvQ44A8-vC3M"
  );
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
      home: getSessionPage(),
    );
  }
}

Widget getSessionPage() {
  if (Supabase.instance.client.auth.currentSession == null) {
    return const LoginPage();
  } else {
    return const DefectReportListPage();
  }
}