import 'package:app_nutricion_ep/src/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:app_nutricion_ep/src/utils/constants/shared_prefer.dart';

class ClientsSolicitudesController {
  BuildContext context;
  SharedPref _sharedPref = new SharedPref();

  Usuario usuario;

  Future init(BuildContext context) async {
    this.context = context;
    usuario = Usuario.fromJson(await _sharedPref.read('usuario'));
  }

  logout() {
    _sharedPref.logout(context);
  }
}
