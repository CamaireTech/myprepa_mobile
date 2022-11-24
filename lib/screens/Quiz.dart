import 'package:flutter/material.dart';

class OrientationScreen extends StatefulWidget {
  const OrientationScreen({Key? key}) : super(key: key);

  @override
  State<OrientationScreen> createState() => _OrientationScreenState();
}

class _OrientationScreenState extends State<OrientationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Text("Orientation"),
      )
    );
  }
}
