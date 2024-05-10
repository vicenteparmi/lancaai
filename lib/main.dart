import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:lancaai/pages/splash.dart';
import 'package:lancaai/theme/theme.dart';
import 'package:lancaai/theme/util.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  // Load shared preferences
  SharedPreferences.getInstance().then((SharedPreferences prefs) {
    final String apiKey = prefs.getString('apiKey') ?? '';
    if (apiKey.isNotEmpty) {
      Gemini.init(apiKey: apiKey);
    }
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;
    TextTheme textTheme =
        createTextTheme(context, "JetBrains Mono", "JetBrains Mono");

    MaterialTheme theme = MaterialTheme(textTheme);

    return MaterialApp(
      title: 'LançaAI',
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      themeMode: ThemeMode.dark,
      home: const Splash(),
    );
  }
}
