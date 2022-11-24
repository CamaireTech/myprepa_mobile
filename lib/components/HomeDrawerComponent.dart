import 'package:flutter/material.dart';
import 'package:jobsearch/screens/ContactUsScreen.dart';
import 'package:jobsearch/screens/TestScreen.dart';
import 'package:jobsearch/screens/PastQuestions.dart';
import 'package:jobsearch/screens/home/DashBoard.dart';
import 'package:jobsearch/screens/home/HomeScreen.dart';
import 'package:nb_utils/nb_utils.dart';
import '../Models/SVDrawerModel.dart';
import '../Theme/app_theme.dart';
import '../screens/Settings.dart';

class HomeDrawerComponent extends StatefulWidget {
  const HomeDrawerComponent({Key? key}) : super(key: key);

  @override
  State<HomeDrawerComponent> createState() => _HomeDrawerComponentState();
}

class _HomeDrawerComponentState extends State<HomeDrawerComponent> {
  List<SVDrawerModel> MenuLists = getDrawerMenuLists();

  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        50.height,
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/Images/profile.png',
                        height: 62, width: 62, fit: BoxFit.cover)
                    .cornerRadiusWithClipRRect(8),
                5.width,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("GenX eSports", style: boldTextStyle(size: 18)),
                    8.height,
                    Text('view TestScreen',
                        style: secondaryTextStyle(
                          color: AppColors.primarydark,
                          size: 15,
                        )),
                  ],
                ),
              ],
            ),
          ],
        ).paddingOnly(left: 16, right: 8, bottom: 20, top: 20),
        20.height,
        Divider(indent: 16, endIndent: 16),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: MenuLists.map((e) {
            int index = MenuLists.indexOf(e);
            return SettingItemWidget(
              decoration: BoxDecoration(
                  color: selectedIndex == index
                      ? AppColors.primaryblue
                      : context.cardColor),
              title: e.title.validate(),
              titleTextStyle: boldTextStyle(size: 14),
              leading: Image.asset(e.image.validate(),
                  height: 22,
                  width: 22,
                  fit: BoxFit.cover,
                  color: AppColors.primarydark),
              onTap: () {
                selectedIndex = index;
                setState(() {});
                if (selectedIndex == 0) {
                  finish(context);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DashBoard()));
                } else if (selectedIndex == 1) {
                  finish(context);
                  ContactUsScreen().launch(context);
                } else if (selectedIndex == 2) {
                  finish(context);
                  TestimonialScreen().launch(context);
                } else if (selectedIndex == 3) {
                  finish(context);
                  TestScreen().launch(context);
                } else if (selectedIndex == 4) {
                  finish(context);
                  TestScreen().launch(context);
                } else if (selectedIndex == 5) {
                  finish(context);
                  TestScreen().launch(context);
                }
              },
            );
          }).toList(),
        ).expand(),
        Divider(indent: 16, endIndent: 16),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("1.0.0"),
        ),
      ],
    );
  }
}
