import 'package:app_nutricion_ep/src/pages/menu/documentos/documentos_page.dart';
import 'package:app_nutricion_ep/src/pages/menu/solicitudes/list_solicitudes.dart';

import 'package:app_nutricion_ep/src/pages/menu/validaciones/list_busc_solicitud_val.dart';
import 'package:app_nutricion_ep/src/pages/menu/validarsoliadmin/list_val_solicitudes.dart';
import 'package:app_nutricion_ep/src/pages/notificaciones/notificaciones.dart';
import 'package:app_nutricion_ep/src/pages/roles/roles_page.dart';
import 'package:flutter/material.dart';
import 'package:app_nutricion_ep/src/pages/client/solicitudes/list/client_solicitudes_list_page.dart';
import 'package:app_nutricion_ep/src/pages/login/login_page.dart';
import 'package:app_nutricion_ep/src/utils/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nutricion Practicas',
      initialRoute: 'login',
      routes: {
        'login': (BuildContext context) => LoginPage(),
        'roles': (BuildContext context) => Menu_Modulo_Estudiante(),
        'solicitudes': (BuildContext context) => List_solicitudes(),
        'solicitudesAdm': (BuildContext context) => List_solicitudesAdm(),
        'notificaciones': (BuildContext context) => NotificacionesPage(),
        'documentos': (BuildContext context) => List_Documentos(),
        'validaciones': (BuildContext context) => List_solicitudes_val(),
        /* '/menu/validaciones': (BuildContext context) => Bus_solicitud(),
        '/menu/solicitudes': (BuildContext context) => Val_solicitudes(),
        '/menu/validarsoliadmin': (BuildContext context) => List_solicitudes(), */
      },
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.system,
     
    );
  }
}
