import 'package:app_nutricion_ep/src/pages/notificaciones/notificaciones_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:app_nutricion_ep/src/pages/client/solicitudes/list/client_solicitudes_list_controller.dart';

class NotificacionesPage extends StatefulWidget {
  const NotificacionesPage({Key key}) : super(key: key);

  @override
  State<NotificacionesPage> createState() => _NotificacionesPageState();
}

class _NotificacionesPageState extends State<NotificacionesPage> {
  Notificaciones_Controller _con = new Notificaciones_Controller();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context);
    });
  }

  @override
  Widget build(BuildContext context)=> Scaffold(
    appBar: AppBar(
      title: const Text('Notificaciones'),
      backgroundColor: Color.fromRGBO(2, 48, 82, 1),
    ),

  );
}

/* {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: _con.logout,
          child: Text('Cerrar session'),
        ),
      ),
    );
  } */