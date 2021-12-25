import 'package:flutter/material.dart';

class MassScreen extends StatefulWidget {
  MassScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MassScreenState createState() => _MassScreenState();
}

class _MassScreenState extends State<MassScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Scaffold(body: Container(child: Text("Mass"))),
    );
  }
}
