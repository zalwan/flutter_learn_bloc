import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_learn_bloc/model.dart';

class ApiService {
  static Future<List<UserModel>> getUsers() async {
    try {
      final response = await Dio().get("https://reqres.in/api/users");
      log('${response.data['data']}');
      return (response.data["data"] as List)
          .map((e) => UserModel.fromJson(e))
          .toList();
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<UserModel> getUsersById(int id) async {
    try {
      final response = await Dio().get("https://reqres.in/api/users/$id");
      log('${response.data['data']}');
      return UserModel.fromJson(response.data['data']);
    } catch (e) {
      throw Exception(e);
    }
  }
}
