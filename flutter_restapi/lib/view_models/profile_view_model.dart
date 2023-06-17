import 'dart:convert';
import 'package:flutter_restapi/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ProfileViewModel extends ChangeNotifier {
  User? user;
  List<User> users = [];
  final String _baseUrl = "https://reqres.in/api/users";
  int perPage = 6;
  int page = 1;
  int totalPage = 1;
  getUser(){
    String data = '{"data":{"id":2,"email":"janet.weaver@reqres.in","first_name":"Janet","last_name":"Weaver","avatar":"https://reqres.in/img/faces/2-image.jpg"},"support":{"url":"https://reqres.in/#support-heading","text":"To keep ReqRes free, contributions towards server costs are appreciated!"}}';
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
    http.Response response = await http.get(Uri.parse("$_baseUrl/$id"));
    var map2 = jsonDecode(response.body);
    user = User.fromJson(map2["data"]);
    notifyListeners();
  }

  Future getUsers() async {
    http.Response responseUsers = await http.get(Uri.parse(_baseUrl+"?page=$page&per_page=$perPage"));
    var map2 = jsonDecode(responseUsers.body); 
    users.clear();
    totalPage = map2["total_pages"];
    print(map2);
    for (var item in map2["data"]) {
      users.add(User.fromJson(item));
    }
    notifyListeners();
  }

  Future setPage(int p) async{
    page = p;
    await getUsers();
  }
}


