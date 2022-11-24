import 'dart:async';
import 'package:flutter/material.dart';
import 'package:jobsearch/Screens/OnBoardingScreen.dart';
import 'package:jobsearch/Theme/app_theme.dart';
import 'package:jobsearch/Theme/text_theme.dart';
import 'package:jobsearch/screens/home/DashBoard.dart';
import 'package:jobsearch/screens/home/LandingScreen.dart';
import 'package:jobsearch/utils/navigate_screen.dart';
import 'package:jobsearch/widget/widget_button.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40.0),
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/Images/LogoMyPrepa1.png',
                height: 200,
              ),
              SizedBox(
                  height: 60.0,
                ),

              Text(
                      'Hey Welcome !',
                      style: AppTextTheme.header,
                    ),

                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                        child: Text(
                      "We help you to better prepare your exams from the constitution to the day by providing you with all the old tests since 20 years.   ",
                      style: AppTextTheme.caption,
                    )),
                  ],
                ),

              SizedBox(
                  height: 90.0,
                ),
              WidgetButton.largeButton('Get Started', AppTextTheme.buttonwhite,
                  AppColors.primaryblue, null, () {
                NavigationScreen.navigate(context, DashBoard());
              })
            ],
          ),
        ),
      ),
    );
  }
}
