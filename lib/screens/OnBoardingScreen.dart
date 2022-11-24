import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:jobsearch/Theme/app_theme.dart';
import 'package:jobsearch/Theme/text_theme.dart';
import 'package:jobsearch/screens/Domain/chose_domain.dart';
import 'package:jobsearch/screens/Login/signin_screen.dart';
import 'package:jobsearch/screens/Login/signup_screen.dart';
import 'package:jobsearch/screens/home/getStarted_screen.dart';
import 'package:translator/translator.dart';
import 'package:http/http.dart' as http;

import 'home/DashBoard.dart';

class OnBoardingScreen extends StatefulWidget {
  final String LangCode;
  const OnBoardingScreen({Key? key, required this.LangCode}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {


  GoogleTranslator translator = new GoogleTranslator();
  String title1 = 'REVISE TO SUCESS';
  String title2 = 'ALL YOU NEED IS HERE';
  String title3 = ' ';

  String body1 =
      'All your need to prepare for your Entrance Examination if found in My Prepa';
  String body2 =
      'All your need to prepare for your Entrance Examination if found in My Prepa';
  String body3 = ' ';
  String skip = 'Skip ';
  String done = 'Done ';

  void trans() {
    translator.translate(title1, to: widget.LangCode).then((output) {
      setState(() {
        title1 = output.toString();
      });
    });
    translator.translate(title2, to: widget.LangCode).then((output) {
      setState(() {
        title2 = output.toString();
      });
    });
    translator.translate(title3, to: widget.LangCode).then((output) {
      setState(() {
        title3 = output.toString();
      });
    });
    translator.translate(body1, to: widget.LangCode).then((output) {
      setState(() {
        body1 = output.toString();
      });
    });
    translator.translate(body2, to: widget.LangCode).then((output) {
      setState(() {
        body2 = output.toString();
      });
    });
    translator.translate(body3, to: widget.LangCode).then((output) {
      setState(() {
        body3 = output.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var listPagesViewModel = [
      PageViewModel(
        title: title1,
        body: body1,
        image: buildImage('assets/Images/split1.png'),
        decoration: getPageDecoration(),
      ),
      PageViewModel(
        title: title2,
        body: body2,
        image: buildImage('assets/Images/split2.png'),
        decoration: getPageDecoration(),
      ),
      PageViewModel(
        title: title3,
        // body: 'body3',
        bodyWidget: Container(
            height: 100,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Container(
                        height: 40,
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shadowColor: Colors.transparent,
                              primary: Colors.white,
                              side: BorderSide(
                                width: 1.0,
                                color: AppColors.primaryblue,
                              )),
                          child: const Text(
                            'SIGN UP',
                            style: TextStyle(color: AppColors.primaryblue),
                          ),
                          onPressed: () {
                             Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUp()));
                          },
                        )),
                  ),
                  Expanded(
                    child: Container(
                        height: 40,
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shadowColor: Colors.transparent,
                            primary: AppColors.primaryblue,
                          ),
                          child: const Text(
                            'SIGN IN',
                            style: TextStyle(color: AppColors.white),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignIn()));
                          },
                        )),
                  ),
                ])),
        image: buildImage('assets/Images/split3.png'),
        decoration: getPageDecoration(),
      ),
    ];

    return SafeArea(
      child: IntroductionScreen(
        pages: listPagesViewModel,
        showSkipButton: true,
        skip: Text(
          skip,
          style: AppTextTheme.buttonblack,
        ),
        done: Text(
          done,
          style: AppTextTheme.buttonblack,
        ),
        onDone: () {
          // Navigator.pushReplacement(context,
          //     MaterialPageRoute(builder: (context) => ChosedDomain()));
        },
        onSkip: () {},
        next: Icon(Icons.arrow_forward_ios, color: AppColors.primaryblue),
        animationDuration:400,
        dotsDecorator: getdotdecorator(),
      ),
    );
  }

  Widget buildImage(String assetName, [double width = 350]) {
    return Image.asset(assetName, width: width);
  }

  DotsDecorator getdotdecorator() => const DotsDecorator(
        size: Size(10.0, 10.0),
        activeColor: AppColors.primaryblue,
        color: Color(0xFFBDBDBD),
        activeSize: Size(42.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      );

  PageDecoration getPageDecoration() => const PageDecoration(
        titleTextStyle: AppTextTheme.title,
        bodyTextStyle: TextStyle(fontSize: 15, color: Colors.grey),
        bodyPadding: EdgeInsets.all(16),
        imagePadding: EdgeInsets.all(24),
      );
}
