import 'dart:convert';

import 'package:app_nutricion_ep/src/models/solicitudes.dart';
import 'package:flutter/material.dart';
import 'package:app_nutricion_ep/src/api/environment.dart';
import 'package:app_nutricion_ep/src/models/response_api.dart';
import 'package:app_nutricion_ep/src/models/usuario.dart';
import 'package:http/http.dart' as http;

class SolcitudProvaider {
  String _url = Environment.EP_NUTRICION;
  String _api = '/api/solicitud';

  BuildContext context;

  Future init(BuildContext context, Usuario usuario) {
    this.context = context;
  }

  Future<List<Solicitud>> getAllsolicitud() async {
    try {
      Uri url = Uri.http(_url, '$_api/solicitudes');
      Map<String, String> headers = {'Content-type': 'application/json'};
      final res = await http.get(url, headers: headers);

      if (res.statusCode == 400) {
        final decode = await json.decode(res.body);
        var list = new List<Solicitud>();

        for (var solicitud in decode['solicitudes']) {
          var sl = new Solicitud.fromJson(solicitud);
          list.add(sl);
        }
        return list;
      }

      /* final data = json.decode(res.body);
      Solicitud solicitud = Solicitud.fromJson(data);
      return solicitud.toList; */
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }
}
