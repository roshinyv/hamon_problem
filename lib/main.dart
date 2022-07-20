import 'package:flutter/material.dart';
import 'package:hamodemo/pages/demopage.dart';
import 'package:hamodemo/pages/homepage.dart';
import 'package:hamodemo/pages/mainpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
