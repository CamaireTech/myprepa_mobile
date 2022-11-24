// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:jobsearch/services/callApi.dart';
import 'package:http/http.dart' as http;
import 'package:jobsearch/widget/widget_alertbox.dart';

class AuthService {
  Future<http.Response> register(BuildContext context, String fName,
      String sName, String pNumber, String email, String password) async {
   
      Map data = {
        "firstName": fName,
        "lastName": sName,
        "phoneNumber": pNumber,
        "email": email,
        "password": password
      };
      // http.Response response = CallApi().postData(data, "register");
      var body = jsonEncode(data);
      var url = Uri.parse('${CallApi.url}register');
      http.Response response = await http.post(
        url,
        headers: CallApi().setHeaders(),
        body: body,
      );
     return response;
  }

     Future<http.Response> login(String email, String password) async {
    Map data = {
      "email": email,
      "password": password,
    };
    var body = json.encode(data);
    var url = Uri.parse('${CallApi.url}login');
    http.Response response = await http.post(
      url,
      headers: CallApi().setHeaders(),
      body: body,
    );
    print(response.body);
    return response;
  }
}
