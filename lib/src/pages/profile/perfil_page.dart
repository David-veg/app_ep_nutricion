import 'package:app_nutricion_ep/src/pages/notificaciones/notificaciones_controller.dart';
import 'package:app_nutricion_ep/src/pages/profile/perfil_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:app_nutricion_ep/src/pages/client/solicitudes/list/client_solicitudes_list_controller.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  PerfilController _con = new PerfilController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context);
    });
  }

   @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Documentos'),
          backgroundColor: Color.fromRGBO(2, 48, 82, 1),
        ),
        
        body: ListView(
  children: const <Widget>[
    
    Card(
      child: ListTile(
        leading: Icon(Icons.folder),
        title: Text('Nombre: Doc #1'),
        subtitle: Text(
          'Estudiante: Yeiser Avila'
        ),
        
        isThreeLine: true,
      ),
    ),
    Card(
      child: ListTile(
        leading: FlutterLogo(size: 72.0),
        title: Text('Nombre: Doc #2'),
        subtitle: Text(
          'Estudiante: Yeiser Avila '
        ),
        
        isThreeLine: true,
      ),
    ),Card(
      child: ListTile(
        leading: FlutterLogo(size: 72.0),
        title: Text('Nombre: Doc #3'),
        subtitle: Text(
          'Estudiante: Yeiser Avila'
        ),
        
        isThreeLine: true,
      ),
    ),Card(
      child: ListTile(
        leading: FlutterLogo(size: 72.0),
        title: Text('Nombre: Doc #4'),
        subtitle: Text(
          'Estudiante: Yeiser Avila'
        ),
        
        isThreeLine: true,
      ),
    ),
  ],
)

        );
}
