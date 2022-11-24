import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jobsearch/Theme/app_theme.dart';
import 'package:jobsearch/screens/home/getStarted_screen.dart';

import '../../Theme/text_theme.dart';
import '../../utils/navigate_screen.dart';
import '../../widget/widget_button.dart';

class ChosedExam extends StatefulWidget {

  ChosedExam({Key? key,}) : super(key: key);

  @override
  ChosedExamState createState() => ChosedExamState();
}

class ChosedExamState extends State<ChosedExam> {
  List<String> schools = ["FMBS","curse","polytech"];
  String school='FMBS';
  String dropdownvalue = 'FMBS';
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var selected;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Text(
                    'Chose Exam',
                    style: AppTextTheme.bigtitle,
                  ),
                ],
              ),
              const SizedBox(
                height: 30.0,
              ),
              Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Flexible(
                      // ignore: unnecessary_const
                      child: const Text(
                    "My prepa need to know the proffesional Carriere your engage in that is your Exam in order to access you the specifique requirement you need ",
                    style: AppTextTheme.caption,
                  )),
                ],
              ),
              const SizedBox(
                height: 25.0,
              ),
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                // DropdownButton<String>(
                //   isDense: true,
                //   hint: new Text("select Exam"),
                //   value: "CATUCC",
                //   onChanged: (val) {
                //     setState(() {
                //       selected = val;
                //     });
                //     print(selected);
                //   },
                //   // ignore: avoid_function_literals_in_foreach_calls
                //   items: schools
                //       .map((String item) => DropdownMenuItem<String>(
                //           child: Text(item), value: item))
                //       .toList(),
                // ),

                getFormatDropdownButton(schools),
                const SizedBox(
                  height: 30,
                ),
              ]),
              WidgetButton.largeButton('Confirm', AppTextTheme.buttonwhite,
                  AppColors.primaryblue, null, () {
                print(schools);
                NavigationScreen.navigate(context,GetStartedScreen());
              }),
            ],
          ),
        ),
      ),
    );
  }

  // Widget getFormatDropdownButton(List<String> items) {
  //   return Column(
  //     children: [
  //       DropdownButton<String>(
  //           value: items[0],
  //           items: items
  //               .map((String item) =>
  //                   DropdownMenuItem<String>(child: Text(item), value: item))
  //               .toList(),
  //           onChanged: (String? newValue) {
  //             setState(() {
  //               // school = newValue!;
  //             });
  //             // print(school);
  //           }),
  //     ],
  //   );
  // }

  
  Padding displayHeading(String text, double size) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Text(text,
          style: TextStyle(fontSize: size, fontWeight: FontWeight.bold)),
    );
  }

    Widget getFormatDropdownButton(List<String> items) {
    // dropdownvalue = items[1];
    return Column(
      children: [
        displayHeading("Select school", 15),
        DropdownButton<String>(
            value: dropdownvalue,
            items: items
                .map((String item) =>
                    DropdownMenuItem<String>(child: Text(item), value: item))
                .toList(),
            onChanged: (String? newValue) {
              
              dropdownvalue = newValue!;
              setState(() {
                dropdownvalue = newValue;
              });
              print(dropdownvalue);
            }),
      ],
    );
  }
}
