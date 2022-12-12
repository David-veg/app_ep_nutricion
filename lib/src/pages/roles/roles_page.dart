import 'package:app_nutricion_ep/src/models/rol.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class RolesPage extends StatefulWidget {
  const RolesPage({Key key}) : super(key: key);

  @override
  State<RolesPage> createState() => _RolesPageState();
}

class _RolesPageState extends State<RolesPage> {
  Future<List<Rol>> listado_roles;

  Future<List<Rol>> _getRol() async {
    final response = await http.get(Uri.https(
        'https://nutricion-backend.herokuapp.com/api/solicitud/solicitudes'));
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      throw Exception("fallo de conexion");
    }
  }

  @override
  void initState() {
    super.initState();
    _getRol();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('hola roles')),
    );
  }
}
