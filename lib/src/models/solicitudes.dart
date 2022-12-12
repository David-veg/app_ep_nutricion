// To parse this JSON data, do
//
//     final solicitud = solicitudFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/foundation.dart';

Solicitud solicitudFromJson(String str) => Solicitud.fromJson(json.decode(str));

String solicitudToJson(Solicitud data) => json.encode(data.toJson());

class Solicitud {
  String idpersona;
  String nombre;
  String apellidos;
  String dni;
  String codigo;
  String idestudiante;
  String telefonoe;
  String ubigeo;
  String nacionalidad;
  String estadocivil;
  String idempresa;
  String nombree;
  String nombrerep;
  String gradosup;
  String cargorep;
  String areappp;
  String telefono;
  String direccion;
  List<Solicitud> toList = [];

  Solicitud({
    this.idpersona,
    this.nombre,
    this.apellidos,
    this.dni,
    this.codigo,
    this.idestudiante,
    this.telefonoe,
    this.ubigeo,
    this.nacionalidad,
    this.estadocivil,
    this.idempresa,
    this.nombree,
    this.nombrerep,
    this.gradosup,
    this.cargorep,
    this.areappp,
    this.telefono,
    this.direccion,
  });

  factory Solicitud.fromJson(Map<String, dynamic> json) => Solicitud(
        idpersona: json["idpersona"],
        nombre: json["nombre"],
        apellidos: json["apellidos"],
        dni: json["dni"],
        codigo: json["codigo"],
        idestudiante: json["idestudiante"],
        telefonoe: json["telefonoe"],
        ubigeo: json["ubigeo"],
        nacionalidad: json["nacionalidad"],
        estadocivil: json["estadocivil"],
        idempresa: json["idempresa"],
        nombree: json["nombree"],
        nombrerep: json["nombrerep"],
        gradosup: json["gradosup"],
        cargorep: json["cargorep"],
        areappp: json["areappp"],
        telefono: json["telefono"],
        direccion: json["direccion"],
      );

  Solicitud.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;
    jsonList.forEach((item) {
      Solicitud solicitud = Solicitud.fromJson(item);
      toList.add(solicitud);
    });
  }

  Map<String, dynamic> toJson() => {
        "idpersona": idpersona,
        "nombre": nombre,
        "apellidos": apellidos,
        "dni": dni,
        "codigo": codigo,
        "idestudiante": idestudiante,
        "telefonoe": telefonoe,
        "ubigeo": ubigeo,
        "nacionalidad": nacionalidad,
        "estadocivil": estadocivil,
        "idempresa": idempresa,
        "nombree": nombree,
        "nombrerep": nombrerep,
        "gradosup": gradosup,
        "cargorep": cargorep,
        "areappp": areappp,
        "telefono": telefono,
        "direccion": direccion,
      };
}
