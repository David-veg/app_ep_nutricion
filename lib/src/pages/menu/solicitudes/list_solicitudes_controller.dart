import 'package:app_nutricion_ep/src/models/solicitudes.dart';
import 'package:app_nutricion_ep/src/models/usuario.dart';
import 'package:app_nutricion_ep/src/provider/users_provider.dart';
import 'package:flutter/material.dart';
import 'package:app_nutricion_ep/src/utils/constants/shared_prefer.dart';

class List_SolicitudesController {
  BuildContext context;
  SharedPref _sharedPref = new SharedPref();
  UsersProvaider usersProvaider = new UsersProvaider();
  Usuario usuario;

  List<String> categoria = ['Listado de documentos'];

  Future init(BuildContext context) async {
    this.context = context;
    await usersProvaider.init(context);

    usuario = Usuario.fromJson(await _sharedPref.read('usuario'));
    
  }

  void logout() {
    _sharedPref.logout(context);
  }
}

