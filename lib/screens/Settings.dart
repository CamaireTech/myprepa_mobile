import 'package:flutter/material.dart';

class TestimonialScreen extends StatefulWidget {
  const TestimonialScreen({Key? key}) : super(key: key);

  @override
  State<TestimonialScreen> createState() => _TestimonialScreenState();
}

class _TestimonialScreenState extends State<TestimonialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Text("Testimonial Screen"),
      )
    );
  }
}
