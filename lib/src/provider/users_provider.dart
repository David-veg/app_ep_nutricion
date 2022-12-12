import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:app_nutricion_ep/src/api/environment.dart';
import 'package:app_nutricion_ep/src/models/response_api.dart';
import 'package:app_nutricion_ep/src/models/usuario.dart';
import 'package:http/http.dart' as http;
class UsersProvaider {
  String _url = Environment.EP_NUTRICION;
  String _api = '/api/users';

  BuildContext context;

  Future init(BuildContext context) {
    this.context = context;
  }

  Future<ResponseApi> create(Usuario usuario) async {
    try {
      Uri url =  Uri.http(_url, '$_api/create-users');
      String bodyParams = json.encode(usuario);
      Map<String, String> headers = {
        'Content-type': 'application/json'
      };
      final res = await http.post(url, headers: headers, body:bodyParams);
      final data = json.decode(res.body);
      ResponseApi responseApi = ResponseApi.fromJson(data);
      return responseApi;

    }
    catch(e){
      print('error: $e');
      return null;
    }
  }

  Future<ResponseApi> Login(String username, String password) async{
    try {
      Uri url =  Uri.http(_url, '$_api/login');
      String bodyParams = json.encode({
        'usuario': username,
        'password': password
      });
      Map<String, String> headers = {
        'Content-type': 'application/json'
      };
      final res = await http.post(url, headers: headers, body:bodyParams);
      final data = json.decode(res.body);
      ResponseApi responseApi = ResponseApi.fromJson(data);
      return responseApi;
    }
    catch(e){
      print('error: $e');
      return null;
    }
  }
}