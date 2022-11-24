import 'package:flutter/material.dart';
import 'package:jobsearch/Theme/app_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 08.0, left: 25, right: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    "Recommended for you",
                    style: TextStyle(
                        color: AppColors.primaryblue,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  Spacer(),
                  Text(
                    "More",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(
                height: 35,
              ),
              SizedBox(height: 25,),
               SizedBox(
                height: 35,
              ),
              Row(
                children: [
                  Text(
                    "App Tips",
                    style: TextStyle(
                        color: AppColors.primaryblue,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Today Tips",
                    style: TextStyle(
                        color: AppColors.icon,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
