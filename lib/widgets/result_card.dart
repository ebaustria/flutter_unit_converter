import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultCard extends StatelessWidget {
  ResultCard({Key? key, required this.conversionResult}) : super(key: key);

  final String conversionResult;

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Theme.of(context).colorScheme.primary,
      elevation: 5.0,
      margin: EdgeInsets.all(10.0),
      child: SizedBox(
        width: 300,
        height: 100,
        child: Center(
          child: Text(conversionResult, style: TextStyle(fontSize: 32)),
        ),
      ),
    );
  }
}