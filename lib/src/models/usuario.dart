import 'dart:convert';

import 'package:app_nutricion_ep/src/models/rol.dart';

Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));

String usuarioToJson(Usuario data) => json.encode(data.toJson());

class Usuario {
  String idUsuario;
  String usuario;
  String idRol;
  String password;
  String idperson;

 
  

  Usuario({
    this.idUsuario,
    this.usuario,
    this.idRol,
    this.password,
    this.idperson,

    
  });

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        idUsuario: json["id_usuario"] is int ? json['id_usuario'].toString() : json["id_usuario"],
        usuario: json["usuario"],
        idRol: json["id_rol"],
        password: json["password"],
        idperson: json["idperson"],

        
      );

  Map<String, dynamic> toJson() => {
        "id_usuario": idUsuario,
        "usuario": usuario,
        "id_rol": idRol,
        "password": password,
        "idperson": idperson,

        
      };
}
