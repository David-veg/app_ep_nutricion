import 'package:app_nutricion_ep/src/pages/menu/documentos/documentos_page.dart';
import 'package:app_nutricion_ep/src/pages/menu/solicitudes/list_solicitudes.dart';
import 'package:app_nutricion_ep/src/pages/notificaciones/notificaciones.dart';
import 'package:app_nutricion_ep/src/pages/profile/perfil_page.dart';
import 'package:app_nutricion_ep/src/pages/roles/roles_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class Menu_Modulo_Estudiante extends StatefulWidget {
  const Menu_Modulo_Estudiante({Key key}) : super(key: key);
  

  @override
  State<Menu_Modulo_Estudiante> createState() => _Menu_Modulo_EstudianteState();
}

class _Menu_Modulo_EstudianteState extends State<Menu_Modulo_Estudiante> {
  List<String> modulo = ["Solitudes", "Anexos"];
  Menu_Modulo_EstudianteController _con = new Menu_Modulo_EstudianteController();
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
          title: const Text(''),
          backgroundColor: Color.fromRGBO(2, 48, 82, 1),
        ),
        drawer: const NavigationDrawer(),
        body: ListView(
          children: [
            ListTile(
              
              title: Text('Solicitud'),
              leading: Icon(Icons.dock_outlined),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const List_solicitudes(),
              )),
            ),
            ListTile(
              
              title: Text('Anexo'),
              leading: Icon(Icons.dock_outlined),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const List_Documentos(),
              )),
            ),

          ],

          ),

        );
      
}

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key key}) : super(key: key);

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  Menu_Modulo_EstudianteController _con = new Menu_Modulo_EstudianteController();

  
  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            buildHeader(context),
            buildMenuItems(context),
          ],
        )),
      );

  Widget buildHeader(BuildContext context) => Material(
        color: Color.fromRGBO(2, 48, 82, 1),
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const UserPage(),
            ));
          },
          child: Container(
            color: Color.fromRGBO(2, 48, 82, 1),
            padding: EdgeInsets.only(
              top: 24 + MediaQuery.of(context).padding.top,
              bottom: 24,
            ),
            child: Column(
              children: const [
                CircleAvatar(
                  radius: 52,
                  backgroundImage: NetworkImage(
                      'https://e7.pngegg.com/pngimages/799/987/png-clipart-computer-icons-avatar-icon-design-avatar-heroes-computer-wallpaper.png'),
                ),
                SizedBox(height: 12),
                Text(
                  'Yeiser Avila',
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
                Text(
                  'yeiser.avila@upue.edu.pe',
                  style: TextStyle(fontSize: 12, color: Colors.white),
                )
              ],
            ),
          ),
        ),
      );

  Widget buildMenuItems(BuildContext context) => Container(
        padding: const EdgeInsets.all(24),
        child: Wrap(
          runSpacing: 16,
          children: [
            ListTile(
              leading: const Icon(Icons.home_mini_outlined),
              title: const Text('Menu'),
              onTap: () =>
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const Menu_Modulo_Estudiante(),
              )),
            ),
            ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text('Noticaciones'),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const NotificacionesPage(),
              )),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Perfil'),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const Menu_Modulo_Estudiante(),
              )),
            ),
            ListTile(
              leading: const Icon(Icons.nightlight_outlined),
              title: const Text('Theme'),
              onTap: (() {}),
            ),
            const Divider(color: Colors.black54),
            ListTile(
              leading: const Icon(Icons.close),
              title: const Text('Cerrar Session'),
              onTap: (() {}),
            ),
          ],
        ),
      );
/* 
  Widget _cardModulo() {
    return Column(
      children: [
        Container(
          height: 100,
          child: FadeInImage(
            image: AssetImage('assets/images/solicitud.png'),
            fit: BoxFit.contain,
            fadeInDuration: Duration(milliseconds: 50),
            placeholder: AssetImage('assets/images/solicitud.png'),
          ),
        ),
        Text(
          'Solicitudes',
          style: TextStyle(fontSize: 16, color: Colors.black),
        )
      ],
    );
  }*/
  
}


 

















/* import 'package:app_nutricion_ep/src/models/rol.dart';
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
 */