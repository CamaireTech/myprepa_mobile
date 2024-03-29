import 'package:flutter/material.dart';
import 'package:jobsearch/Theme/app_theme.dart';
import 'package:jobsearch/Theme/text_theme.dart';
import 'package:jobsearch/screens/Domain/chose_domain.dart';
import 'package:jobsearch/screens/Domain/chose_exam.dart';
import 'package:jobsearch/widget/widget_button.dart';

import '../../utils/navigate_screen.dart';

class CodeVerification extends StatefulWidget {
  const CodeVerification({Key? key}) : super(key: key);

  @override
  _CodeVerificationState createState() => _CodeVerificationState();
}

class _CodeVerificationState extends State<CodeVerification> {
  final _formKey = GlobalKey<FormState>();
  late bool alert;
  late String email, pwd, phone_num;

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
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    'Confirm Code',
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
                    "a verification code have been send to your email please confirm",
                    style: AppTextTheme.caption,
                  )),
                ],
              ),
              SizedBox(
                height: 25.0,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Enter Code ',
                          hintText: "",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                              borderSide: BorderSide(color: Colors.grey)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                              borderSide: BorderSide(color: Colors.blue)),
                        ),
                        keyboardType: TextInputType.number,
                        validator: (val) =>
                            val!.isEmpty ? 'password is required' : null,
                        onChanged: (val) {
                          setState(() => pwd = val);
                        }),
                    SizedBox(height: 40),
                    WidgetButton.largeButton(
                        'Confirm',
                        AppTextTheme.buttonwhite,
                        AppColors.primaryblue,
                        null, () {
                      NavigationScreen.replaceNavigate(context,ChosedDomain());
                    }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        WidgetButton.textButton('Did not recieve code ?',
                            AppTextTheme.body2, () {}),
                        WidgetButton.textButton(
                            'resend', AppTextTheme.link, () {}),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> showalertDialogue() async {
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("LOGIN ERROR"),
      content: Text("Credential Enter are Invalid "),
      actions: [
        okButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
