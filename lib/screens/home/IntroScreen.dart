import 'dart:async';
import 'package:flutter/material.dart';
import 'package:jobsearch/Screens/OnBoardingScreen.dart';
import 'package:jobsearch/screens/home/LandingScreen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {

  @override
  void initState(){
    super.initState();

    Future.delayed(const Duration(seconds:2 ),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>  const LandingScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/Images/LogoMyPrepa1.png', height: 200,),
          ],
        ),
      ),
    );
  }
}
