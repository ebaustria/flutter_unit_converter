import 'package:flutter/material.dart';

import 'navBar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unit Converter',
      theme: ThemeData(primarySwatch: Colors.deepPurple,),
      home: NavBar(title: 'Unit Converter'),
    );
  }
}
