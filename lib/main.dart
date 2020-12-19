import 'package:clocky_app/clock_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(clockMain());

class clockMain extends StatefulWidget {
  @override
  _clockMainState createState() => _clockMainState();
}

class _clockMainState extends State<clockMain> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clock App',
      home: clock_screen(),
    );
  }
}
