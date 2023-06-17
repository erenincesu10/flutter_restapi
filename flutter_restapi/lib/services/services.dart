import 'dart:convert';

import 'package:flutter_restapi/constants/service_constants.dart';
import 'package:flutter_restapi/services/response_model.dart';
import 'package:http/http.dart' as http;

class Services {
  Future<ResponseModel> getUser(int id) async {
    http.Response response = await http.get(getUrl("users/$id"));
    Map<String, dynamic>? data = null;
    try {
      data = jsonDecode(response.body)["data"];
    } catch (e) {
      print(e.toString());
    }
    return ResponseModel(statusCode: response.statusCode, data: data);
  }

  Future<ResponseModel> getUsers([int page = 1, int perPage = 6]) async {
    http.Response response =
        await http.get(getUrl("users?page=$page&per_page=$perPage&delay=3"));
    Map<String, dynamic>? data = null;
    try {
      data = jsonDecode(response.body);
    } catch (e) {
      print(e.toString());
    }
    return ResponseModel(statusCode: response.statusCode, data: data);
  }

  Future<ResponseModel> login(Map<String, dynamic> credential) async {
    http.Response response = await http.post(getUrl("login"), body: credential);
    Map<String, dynamic>? data = null;
    try {
      data = jsonDecode(response.body);
    } catch (e) {
      print(e.toString());
    }
    return ResponseModel(statusCode: response.statusCode, data: data);
  }
}
