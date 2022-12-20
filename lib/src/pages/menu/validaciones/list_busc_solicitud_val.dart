import 'dart:convert';

import 'package:app_nutricion_ep/src/api/environment.dart';
import 'package:app_nutricion_ep/src/models/solicitudes.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/src/widgets/framework.dart';
import 'package:app_nutricion_ep/src/pages/menu/solicitudes/list_solicitudes_controller.dart';
import 'package:app_nutricion_ep/src/utils/constants/my_colors.dart';
import 'package:app_nutricion_ep/src/provider/solicitudes_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class List_solicitudes_val extends StatefulWidget {
  const List_solicitudes_val({Key key}) : super(key: key);

  @override
  State<List_solicitudes_val> createState() => _List_solicitudes_valState();
}

class _List_solicitudes_valState extends State<List_solicitudes_val> {
  Map<String, dynamic> data;
  List postsData = [];
  /////////// TRAYENDO TODA LA DATA GENERAL

  _getData() async {
    String _url = Environment.EP_NUTRICION;
    String _api = '/api/solicitud';

    try {
      Uri url = Uri.http(_url, '$_api/solicitudpendiente');
      Map<String, String> headers = {'Content-type': 'application/json'};
      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        String body = utf8.decode(response.bodyBytes);
        final jsonData = jsonDecode(body);
        print("EMPIENSA CONSULTA");
        print(jsonData["data"][0]["nombreapellidorep"]);
        print("Resultadoooooooo");
        postsData = jsonData["data"];
        print(postsData);
        print("resultado postadata [0]");
        print(postsData[0]);
        print("acabo");
        print(postsData[0]);
        print("CONTRADOR");
        print(postsData.length);
        print(postsData[0]['nombreapellidorep']);
      } else {
        throw Exception("fallo conexion");
      }

      /* final data = json.decode(res.body);
      Documento documento = Documento.fromJson(data);
      return documento.toList; */
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }

  

  @override
  void initState() {
    // TODO: implement initState
    _getData();
    super.initState();
 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("data"),
          backgroundColor: Color.fromRGBO(2, 48, 82, 1),
          actions: <Widget>[
            FloatingActionButton.small(
                // backgroundColor: AppTheme.primary,
                onPressed: () {
                  setState(() {});
                  ;
                },
                child: Icon(Icons.search)
              
                )
          ],
        ),
        body: ListView.builder(
            itemCount: postsData.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                  child: ListTile(
                leading: Icon(
                  Icons.share,
                  color: Color.fromRGBO(2, 48, 82, 1),
                ),
                title: Text("Empresa: :  ${postsData[index]['nombreemp']}"),
                subtitle: Column(
                  children: [
                    Text(postsData[index]['nombreapeliidorep']),
                    Text(postsData[index]['gradorep']),
                    Text(postsData[index]['codigo']),
             
                  ],
                ),
              ));
            }));
  }
  
}
