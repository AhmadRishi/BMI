import 'package:bmi/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.teal),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      home: HomePage(),
    );
  }
}
