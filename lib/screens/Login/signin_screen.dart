import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:jobsearch/Theme/app_theme.dart';
import 'package:jobsearch/Theme/text_theme.dart';
import 'package:jobsearch/screens/Domain/chose_domain.dart';
import 'package:jobsearch/screens/Login/verifie_email.dart';
import 'package:jobsearch/screens/Login/signup_screen.dart';
import 'package:jobsearch/utils/navigate_screen.dart';
import 'package:jobsearch/widget/widget_button.dart';
import 'package:jobsearch/widget/widget_icon.dart';

import '../../services/auth.dart';
import '../../widget/widget_alertbox.dart';
import '../../widget/widget_textformfield.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  late bool alert;
  late String email, pwd, phone_num;
  TextEditingController emailController = TextEditingController();
  TextInputType emailKeytype = TextInputType.emailAddress;

  TextEditingController passwordController = TextEditingController();

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
                    'Sign In',
                    style: AppTextTheme.bigtitle,
                  ),
                ],
              ),
              SizedBox(
                height: 35.0,
              ),
              Row(
                children: [
                  Flexible(
                      child: Text(
                    "Welcome Back!",
                    style: AppTextTheme.header,
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
                    WidgetTextForm.getTextField('Email', emailController,
                        emailKeytype, ' Enter Email', WidgetIcon.email(false)),
                    SizedBox(height: 20),
                    SizedBox(height: 20),
                    TextFormField(
                        controller: passwordController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.vpn_key, color: Colors.blue),
                          labelText: 'Password',
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
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        validator: (val) =>
                            val!.isEmpty ? 'password is required' : null,
                        onChanged: (val) {
                          setState(() => pwd = val);
                        }),
                    SizedBox(height: 40),
                    WidgetButton.largeButton('SignIn', AppTextTheme.buttonwhite,
                        AppColors.primaryblue, null, () async {
                      // NavigationScreen.navigate(context, ChosedDomain());
                      // AuthService().login(email, password)
                      if (_formKey.currentState!.validate()) {
                        http.Response response = await AuthService().login(
                            emailController.text, passwordController.text);

                        Map responseMap = jsonDecode(response.body);
                        if (response.statusCode == 200) {
                          AlertBox.alertbox(
                              context, "Login", responseMap["message"], () {
                            NavigationScreen.navigate(context, ChosedDomain());
                            
                          });
                        } else {
                          var error = json.decode(response.body);
                          error["errors"]["email"].toString() != null
                              ? AlertBox.alertbox(context, "Registration",
                                  error["errors"]["email"].toString(), () {})
                              : null;
                        }
                      }
                    }),
                  ],
                ),
              ),
              Column(
                children: [
                  WidgetButton.textButton(
                      'Forgotten Password', AppTextTheme.caption, () {
                    NavigationScreen.replaceNavigate(context, ConfirmEmail());
                  }),
                  SizedBox(
                    height: 20,
                  ),
                  WidgetButton.largeButton(
                      'Sign In with Google',
                      AppTextTheme.buttonblack,
                      AppColors.white,
                      WidgetIcon.googleLogo(null, null, null), () {
                    NavigationScreen.navigate(context, SignUp());
                    // AuthService().login(email, password)
                  }),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      WidgetButton.textButton(
                          'Dont have an account?', AppTextTheme.body2, () {}),
                      WidgetButton.textButton('SignUp', AppTextTheme.link, () {
                        // NavigationScreen.navigate(context, SignUp());
                      }),
                    ],
                  ),
                ],
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
