import 'package:app_nutricion_ep/src/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:app_nutricion_ep/src/utils/constants/shared_prefer.dart';

class List_SolicitudesController {
  BuildContext context;
  SharedPref _sharedPref = new SharedPref();
  
  List<String> categoria = ['Solitudes Enviadas','Validar Solicitudes'];

  void logout(){
    _sharedPref.logout(context);

  }
}
