import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:model_dart/constants/service_constants.dart';
import 'package:model_dart/models/user_model.dart';
import 'package:model_dart/services/response_model.dart';
import 'package:model_dart/services/services.dart';

class ProfileViewModel extends ChangeNotifier {
  User? user;
  List<User> users = [];
  final Services services = Services();
  int perPage = 6;
  int page = 1;
  int totalPage = 1;
  bool loading = false;
  getUser() {
    String data =
        '{"data":{"id":2,"email":"janet.weaver@reqres.in","first_name":"Janet","last_name":"Weaver","avatar":"https://reqres.in/img/faces/2-image.jpg"},"support":{"url":"https://reqres.in/#support-heading","text":"To keep ReqRes free, contributions towards server costs are appreciated!"}}';
    var map = jsonDecode(data);
    user = User.fromJson(map["data"]);
    /*User user = User(
      id: map["data"]["id"],
      firstName: map["data"]["first_name"],
      lastName: map["data"]["id"],
      email: map["data"]["email"],
      avatar: map["data"]["avatar"],
      );*/
    //notifyListeners();
  }

  Future getUserHttp(int id) async {
    loading = true;
    notifyListeners();
    ResponseModel response = await services.getUser(id);
    if (response.success) user = User.fromJson(response.data!);
    loading = false;
    notifyListeners();
  }

  Future getUsers() async {
    loading = true;
    notifyListeners();
    ResponseModel response = await services.getUsers(page);
    if (response.success) {
      users.clear();
      totalPage = response.data!["total_pages"];
      //print(map2);
      for (var item in response.data!["data"]) {
        users.add(User.fromJson(item));
      }
    }

    loading = false;
    notifyListeners();
  }

  Future<ResponseModel> login(Map<String, dynamic> credential) async {
    ResponseModel response = await services.login(credential);
    return response;
  }

  Future setPage(int p) async {
    page = p;
    await getUsers();
  }
}
