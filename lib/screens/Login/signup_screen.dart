// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:jobsearch/screens/Login/code_verification.dart';
import 'package:jobsearch/screens/Login/signin_screen.dart';
import 'package:jobsearch/screens/Login/verifie_email.dart';
import 'package:jobsearch/services/auth.dart';
import 'package:jobsearch/utils/navigate_screen.dart';
import 'package:jobsearch/widget/widget_icon.dart';
import 'package:http/http.dart' as http;
import '../../Theme/app_theme.dart';
import '../../Theme/text_theme.dart';
import '../../widget/widget_alertbox.dart';
import '../../widget/widget_button.dart';
import '../../widget/widget_textformfield.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController secondNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  late String uname, email, pwd, phno;
  String message = "check your connection";
  TextInputType emailKeytype = TextInputType.emailAddress;
  TextInputType passwordKeytype = TextInputType.visiblePassword;
  TextInputType textKeytype = TextInputType.text;

  ElevatedButton getbutton(GlobalKey<FormState> formKey, String text,
      TextStyle textStyle, Color backgroundColor, Widget? logo) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          onSurface: AppColors.primaryblue,
          primary: backgroundColor,
          fixedSize: const Size(350, 50)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          logo == null ? Container() : logo,
          SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: textStyle,
          ),
        ],
      ),
      onPressed: () async {
        if (formKey.currentState!.validate()) {}
        // alertDia ? '' : showalertDialogue();
        // function;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    void navigate() {
      if (_formKey.currentState!.validate()) {
        NavigationScreen.navigate(context, CodeVerification());
      }
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40.0),
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Text(
                      'Create \nAccount',
                      style: AppTextTheme.bigtitle,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                     WidgetTextForm.getTextField(
                          'First Name',
                          firstNameController,
                          textKeytype,
                          ' Enter First Name',
                          WidgetIcon.userAccount(false)),
                      SizedBox(height: 20),
                      WidgetTextForm.getTextField(
                          'Second Name',
                          secondNameController,
                          textKeytype,
                          ' Enter Last Name',
                          WidgetIcon.userAccount(false)),
                      SizedBox(height: 20),
                      IntlPhoneField(
                        decoration: const InputDecoration(
                          labelText: 'Phone Number',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                        ),
                        initialCountryCode: 'CM',
                        onChanged: (phone) {
                          setState(() => phno = phone.completeNumber);
                        },
                      ),
                      SizedBox(height: 10),
                      WidgetTextForm.getTextField('Email', emailController, emailKeytype,
                          ' Enter Email', WidgetIcon.email(false)),
                      SizedBox(height: 20),
                      WidgetTextForm.getTextField(
                          'Password',
                          passwordController,
                          passwordKeytype,
                          ' Enter Password',
                          WidgetIcon.passwordKey(false)),
                      SizedBox(height: 20),
                      WidgetTextForm.getTextField(
                          'Password',
                          rePasswordController,
                          passwordKeytype,
                          ' Enter Password',
                          WidgetIcon.passwordKey(false)),
                      SizedBox(height: 20),
                      WidgetButton.largeButton(
                          'Register',
                          AppTextTheme.buttonwhite,
                          AppColors.primaryblue,
                          null, () async {
                            if (_formKey.currentState!.validate()) {
                      http.Response response = await AuthService().register(
                            context,
                            firstNameController.text,
                            secondNameController.text,
                            phno,
                            emailController.text,
                            passwordController.text);

                        Map responseMap = jsonDecode(response.body);
                        if (response.statusCode == 200) {
                          AlertBox.alertbox(
                              context, "Registration", responseMap["message"],
                              () {
                            NavigationScreen.navigate(
                                context, CodeVerification());
                          });
                        } else {
                          var error = json.decode(response.body);
                          error["errors"]["email"].toString() != null
                              ? AlertBox.alertbox(context, "Registration",
                                  error["errors"]["email"].toString(), () {
                                })
                              : null;
                        }
                             }
              
                      }),
                      SizedBox(
                        height: 20,
                      ),
                      WidgetButton.largeButton(
                          'Sign In with Google',
                          AppTextTheme.buttonblack,
                          AppColors.white,
                          WidgetIcon.googleLogo(null, null, null),
                          () {}),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                WidgetButton.textButton(
                    'Already have an account', AppTextTheme.link, () {
                  NavigationScreen.replaceNavigate(context, SignIn());
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // TextFormField WigetTextField(String text, TextEditingController controller,
  //     TextInputType keytype, String errorText, Widget icon) {
  //   return TextFormField(
  //       controller: controller,
  //       keyboardType: keytype,
  //       obscureText: keytype == TextInputType.visiblePassword ? true : false,
  //       // obscureText: true,
  //       decoration: InputDecoration(
  //         fillColor: AppColors.primaryblue,
  //         contentPadding:
  //             const EdgeInsets.symmetric(vertical: 12.0, horizontal: 5.0),
  //         prefixIcon: icon,
  //         labelText: text,
  //         // hintText: hinttext.isEmpty ? hinttext : ' ',
  //         border: OutlineInputBorder(
  //             borderRadius: BorderRadius.all(
  //               Radius.circular(10.0),
  //             ),
  //             borderSide: BorderSide(color: Colors.grey)),
  //         focusedBorder: OutlineInputBorder(
  //             borderRadius: BorderRadius.all(
  //               Radius.circular(10.0),
  //             ),
  //             borderSide: BorderSide(color: Colors.blue)),
  //       ),
  //       validator: (val) => val!.isEmpty ? errorText : null,
  //       onChanged: (val) {
  //         // setState(() => uname = val);
  //       });
  // }
}
