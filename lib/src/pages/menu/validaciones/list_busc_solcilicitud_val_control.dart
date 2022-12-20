import 'package:app_nutricion_ep/src/models/solicitudes.dart';
import 'package:app_nutricion_ep/src/models/usuario.dart';
import 'package:app_nutricion_ep/src/provider/solicitudes_provider.dart';
import 'package:app_nutricion_ep/src/provider/users_provider.dart';
import 'package:flutter/material.dart';
import 'package:app_nutricion_ep/src/utils/constants/shared_prefer.dart';

class List_SolicitudesEstController {
  BuildContext context;
  SharedPref _sharedPref = new SharedPref();
  SolcitudProvaider _documentoProvaider = new SolcitudProvaider();
  Usuario usuario;

  List<String> categoria = ['Listado de Solicitud'];

  Future init(BuildContext context) async {
    this.context = context;
    

    usuario = Usuario.fromJson(await _sharedPref.read('usuario'));
    
  }
  

  void logout() {
    _sharedPref.logout(context);
  }
}
