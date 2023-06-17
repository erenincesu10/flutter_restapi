import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class RegisterViewModel extends ChangeNotifier{
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future registerNewUser() async {
    var body = {
      "email" : usernameController.text,
      "password" : passwordController.text,
    };
    http.Response response = await http.post(Uri.parse("https://reqres.in/api/register"),
    body: body);
    if(response.statusCode >= 200 && response.statusCode < 300)
    {
      print(response.statusCode.toString());
      print(response.body);
    }
  }
}