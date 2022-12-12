import 'package:app_nutricion_ep/src/models/solicitudes.dart';
import 'package:app_nutricion_ep/src/models/usuario.dart';
import 'package:app_nutricion_ep/src/provider/solicitudes_provider.dart';
import 'package:app_nutricion_ep/src/provider/users_provider.dart';
import 'package:flutter/material.dart';
import 'package:app_nutricion_ep/src/utils/constants/shared_prefer.dart';

class List_SolicitudesAdmController extends ChangeNotifier{
  BuildContext context;
  SharedPref _sharedPref = new SharedPref();
  UsersProvaider usersProvaider = new UsersProvaider();
  Usuario usuario;
  List<Solicitud> solicitud;

  Future<List<Solicitud>> getAllsolicitud() async {
    if (solicitud != null) {
      return solicitud;
    }
    var service = new SolcitudProvaider();
    this.solicitud = await service.getAllsolicitud();
    notifyListeners();
    return solicitud;
  }

  Future<List<Solicitud>> refreshSolicitudes() async {
    
    var service = new SolcitudProvaider();
    this.solicitud = await service.getAllsolicitud();
    notifyListeners();
    return solicitud;
  }

  List<String> categoria = ['Solicitudes Enviadas', 'Validar Solicitudes'];
  SolcitudProvaider _solcitudProvaider = new SolcitudProvaider();

  Future init(BuildContext context) async {
    this.context = context;
    await usersProvaider.init(context);

    usuario = Usuario.fromJson(await _sharedPref.read('usuario'));

    _solcitudProvaider.init(context, usuario);
  }

  void logout() {
    _sharedPref.logout(context);
  }
}
