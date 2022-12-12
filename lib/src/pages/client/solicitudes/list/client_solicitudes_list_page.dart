import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:app_nutricion_ep/src/pages/client/solicitudes/list/client_solicitudes_list_controller.dart';

class ClientsSolicitudesPage extends StatefulWidget {
  const ClientsSolicitudesPage({Key key}) : super(key: key);

  @override
  State<ClientsSolicitudesPage> createState() => _ClientsSolicitudesPageState();
}

class _ClientsSolicitudesPageState extends State<ClientsSolicitudesPage> {
  ClientsSolicitudesController _con = new ClientsSolicitudesController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: _con.logout,
          child: Text('Cerrar session'),
        ),
      ),
    );
  }
}
