import 'package:flutter/material.dart';
import 'di/dependency_injection.dart';
import 'ui/features/home/home_page.dart';
import 'utils/my_colors.dart';

void main() {
  setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World',
      theme: ThemeData(
        primaryColor: primary,
        primaryColorDark: primary_dark,
        accentColor: accent,

        // Define the default font family.
        fontFamily: 'Georgia',

      ),
      home: HomePage(),
    );
  }
}
