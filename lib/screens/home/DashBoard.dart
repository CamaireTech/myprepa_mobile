import 'package:flutter/material.dart';
import 'package:jobsearch/Screens/BookmarkScreen.dart';
import 'package:jobsearch/Theme/text_theme.dart';
import 'package:jobsearch/screens/PastQuestions.dart';
import 'package:jobsearch/screens/Quiz.dart';
import 'package:jobsearch/screens/Settings.dart';
import 'package:jobsearch/screens/home/HomeScreen.dart';
import 'package:jobsearch/widget/appbar.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../Theme/app_theme.dart';
import '../../components/HomeDrawerComponent.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int selectedIndex = 0;
  String AppBarTitle = 'My Prepa';

  Widget getFragment() {
    if (selectedIndex == 0) {
      return const HomeScreen();
    } else if (selectedIndex == 1) {
      return const PastQuestionsScreen();
    } else if (selectedIndex == 2) {
      return const OrientationScreen();
    } else if (selectedIndex == 3) {
      return const TestimonialScreen();
    }
    return const HomeScreen();
  }

  void AppBarName() {
    switch (selectedIndex) {
      case 0:
        AppBarTitle = 'My Prepa';
        break;
      case 1:
        AppBarTitle = 'Papers';
        break;
      case 2:
        AppBarTitle = 'Orientation';
        break;
      case 3:
        AppBarTitle = 'Testimonials';
        break;
      default:
        AppBarTitle = 'My Prepa';
    }
  }

  @override
  void initState() {
    
    setStatusBarColor(Colors.transparent);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(AppBarTitle),
      drawer: const Drawer(
        child: HomeDrawerComponent(),
      ),
      body: getFragment(),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(0),
        child: BottomNavigationBar(
          showSelectedLabels: false,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.bottomtap,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset('assets/Icons/icon_home.png',
                      height: 24.66,
                      width: 24.66,
                      fit: BoxFit.cover,
                      color: AppColors.icon)
                  .paddingTop(12),
              label: 'Home',
              activeIcon: Image.asset('assets/Icons/icon_home.png',
                      height: 24.66,
                      width: 24.66,
                      fit: BoxFit.cover,
                      color: AppColors.primarydark)
                  .paddingTop(12),
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/Icons/icon_papers.png',
                      height: 24.66,
                      width: 24.66,
                      fit: BoxFit.cover,
                      color: AppColors.icon)
                  .paddingTop(12),
              label: 'Papers',
              activeIcon: Image.asset('assets/Icons/icon_papers.png',
                      height: 24.66,
                      width: 24.66,
                      fit: BoxFit.cover,
                      color: AppColors.primarydark)
                  .paddingTop(12),
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/Icons/icon_orientation.png',
                      height: 24.66,
                      width: 24.66,
                      fit: BoxFit.cover,
                      color: AppColors.icon)
                  .paddingTop(12),
              label: 'Orientation',
              activeIcon: Image.asset('assets/Icons/icon_orientation.png',
                      height: 24.66,
                      width: 24.66,
                      fit: BoxFit.cover,
                      color: AppColors.primarydark)
                  .paddingTop(12),
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/Icons/icon_testimonials.png',
                      height: 24.66,
                      width: 24.66,
                      fit: BoxFit.cover,
                      color: AppColors.icon)
                  .paddingTop(12),
              label: 'Testimonials',
              activeIcon: Image.asset('assets/Icons/icon_testimonials.png',
                      height: 24.66,
                      width: 24.66,
                      fit: BoxFit.cover,
                      color: AppColors.primarydark)
                  .paddingTop(12),
            ),
          ],
          onTap: (val) {
            selectedIndex = val;
            AppBarName();
            setState(() {});
          },
          currentIndex: selectedIndex,
        ),
      ),
    );
  }
}
