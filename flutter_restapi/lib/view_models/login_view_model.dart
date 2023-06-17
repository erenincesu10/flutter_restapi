import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_restapi/services/response_model.dart';
import 'package:flutter_restapi/services/services.dart';
import 'package:http/http.dart' as http;


//eve.holt@reqres.in
//cityslicka

class LoginViewModel extends ChangeNotifier {
  TextEditingController usernameController =
      TextEditingController(text: "eve.holt@reqres.in");
  TextEditingController passwordController =
      TextEditingController(text: "cityslicka");
  bool girisOnaylandi = false;

  Services services = Services();

  Future<bool> login() async {
    var body = {
      "email": usernameController.text,
      "password": passwordController.text,
    };
    print(body);

    ResponseModel response = await services.login(body);
    if (response.success) {}
    girisOnaylandi = response.success;
    return response.success;
  }
}
