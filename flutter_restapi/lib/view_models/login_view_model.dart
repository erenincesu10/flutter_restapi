import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginViewModel extends ChangeNotifier{
  TextEditingController usernameController = TextEditingController(text: "eve.holt@reqres.in");
  TextEditingController passwordController = TextEditingController(text: "cityslicka");

  Future login() async{
    var body = {
      "email" : usernameController.text,
      "password" : passwordController.text,
    };
    print(body);

    http.Response response = await http.post(Uri.parse("https://reqres.in/api/login"),
    body: json.encode(body),
    //body : body,
    headers: {"Content-Type" : "application/json"},);
    if(response.statusCode >= 200 && response.statusCode < 300)
    {
      print(response.statusCode.toString());
      print(response.body);
    }

  }



}