import 'package:flutter/material.dart';
import 'package:pr2_locator_app/screens/home_screen.dart';

import 'screens/settings_screen.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/' : (context) => const HomeScreen(),
        'settings_screen' : (context) => const SettingsScreen(),
      },
    );
  }
}
