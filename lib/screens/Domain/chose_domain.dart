import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jobsearch/Theme/app_theme.dart';
import 'package:jobsearch/screens/Domain/chose_exam.dart';

import '../../Theme/text_theme.dart';
import '../../bloc/bloc/domainBloc/domain_state.dart';
import '../../bloc/bloc_export.dart';
import '../../models/Domain.dart';
import '../../utils/navigate_screen.dart';
import '../../widget/widget_button.dart';

class ChosedDomain extends StatefulWidget {
  @override
  ChosedDomainState createState() => ChosedDomainState();
}

class ChosedDomainState extends State<ChosedDomain> {
  bool selectCondition = false;
  bool valueCheck = false;
  List<CheckBoxListTileModel> checkBoxListTileModel = [];

  List<Domain> getDomain() {
    List<Domain> allDomain = [];

    for (var element in checkBoxListTileModel) {
      if (element.isCheck) {
        allDomain.add(element.domain);
      }
    }
    return allDomain;
  }

  void itemChange(bool val, int index) {
    print(checkBoxListTileModel[index].isCheck);
    setState(() {
      checkBoxListTileModel[index].isCheck =
          !checkBoxListTileModel[index].isCheck;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DomainBloc, DomainState>(
      builder: (context, state) {
        checkBoxListTileModel =
            CheckBoxListTileModel.getDomain(state.allDomains);
        return Scaffold(
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        'Chose Domain',
                        style: AppTextTheme.bigtitle,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    children: [
                      Flexible(
                          child: Text(
                        "My prepa need to know the proffesional Carriere your engage in that is your domain in order to access you the specifique requirement you need ",
                        style: AppTextTheme.caption,
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  Text(
                    textDirection: TextDirection.ltr,
                    'Chose one or more ',
                    style: AppTextTheme.title,
                  ),
                  Column(
                    children: [
                      ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: checkBoxListTileModel.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              child: Container(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  children: <Widget>[
                                    CheckboxListTile(
                                        activeColor: AppColors.primaryblue,
                                        dense: true,
                                        //font change
                                        title: Text(
                                          checkBoxListTileModel[index]
                                              .domain
                                              .domainName!,
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 0.5),
                                        ),
                                        // value: checkBoxListTileModel[index]
                                        //     .isCheck,
                                        value: checkBoxListTileModel[index]
                                                .isCheck,
                                        secondary: Container(
                                          height: 50,
                                          width: 50,
                                          // child: Image.asset(
                                          //   checkBoxListTileModel[index].img,
                                          //   fit: BoxFit.cover,
                                          // ),
                                        ),
                                        onChanged: (val) {
                                          selectCondition = false;
                                          checkBoxListTileModel[index]
                                              .itemChange();
                                          // itemChange(val!, index);
                                          print(checkBoxListTileModel[index]
                                              .isCheck);
                                        })
                                  ],
                                ),
                              ),
                            );
                          }),
                    ],
                  ),
                  selectCondition
                      ? Text(
                          'please select a school',
                          style: TextStyle(color: Colors.red),
                        )
                      : Container(),
                  SizedBox(
                    height: 30,
                  ),
                  WidgetButton.largeButton('Confirm', AppTextTheme.buttonwhite,
                      AppColors.primaryblue, null, () {
                    getDomain().isEmpty
                        ? setState(() {
                            selectCondition = true;
                          })
                        : NavigationScreen.navigate(context, ChosedExam());
                  }),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class CheckBoxListTileModel {
  int id;
  bool isCheck;
  Domain domain;

  CheckBoxListTileModel(
      {required this.id, required this.isCheck, required this.domain});

  static List<CheckBoxListTileModel> getDomain(List<Domain> listDomain) {
    List<CheckBoxListTileModel> allCheckBoxList = [];
    for (var element in listDomain) {
      allCheckBoxList.add(CheckBoxListTileModel(
          id: element.id, isCheck: false, domain: element));
    }

    return allCheckBoxList;
  }

  void itemChange() {
    this.isCheck = !this.isCheck;
  }
}
