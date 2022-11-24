import 'package:flutter/material.dart';
import 'package:jobsearch/Theme/text_theme.dart';
import 'package:jobsearch/bloc/bloc_export.dart';
import 'package:jobsearch/screens/OnBoardingScreen.dart';
import 'package:provider/provider.dart';

import '../../services/provider.dart';
import 'package:http/http.dart' as http;

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    String LangCode = Provider.of<AppLang>(context).appLang;
    return BlocBuilder<SchoolBloc, SchoolState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Container(
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // ignore: prefer_const_constructors
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 67,
                            top: 275,
                            right: 67,
                          ),
                          child: Text(
                            "Continue with",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppTextTheme.title,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                            padding: const EdgeInsets.only(
                              left: 77,
                              top: 53,
                              right: 77,
                            ),
                            child: TextButton.icon(
                              label: const Text(
                                "ENGLISH",
                                style: AppTextTheme.listtitle,
                              ),
                              onPressed: () {
                                Provider.of<AppLang>(context, listen: false)
                                    .changeappLang('en');
                                LangCode =
                                    Provider.of<AppLang>(context, listen: false)
                                        .appLang;
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => OnBoardingScreen(
                                            LangCode: LangCode)));
                              },
                              icon: Image.asset('assets/Images/enflag.png'),
                            )),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                            padding: const EdgeInsets.only(
                              left: 77,
                              top: 20,
                              right: 77,
                              bottom: 400,
                            ),
                            child: TextButton.icon(
                              onPressed: () {
                                Provider.of<AppLang>(context, listen: false)
                                    .changeappLang('fr');
                                LangCode =
                                    Provider.of<AppLang>(context, listen: false)
                                        .appLang;
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => OnBoardingScreen(
                                            LangCode: LangCode)));
                              },
                              icon: Image.asset('assets/Images/frflag.png'),
                              label: Text(
                                "FRENCH",
                                style: AppTextTheme.listtitle,
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
