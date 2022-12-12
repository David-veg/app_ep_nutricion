import 'dart:convert';

Rol rolFromJson(String str) => Rol.fromJson(json.decode(str));

String rolToJson(Rol data) => json.encode(data.toJson());

class Rol {
    String idSidebar;
    String nombre;
    String path;
    String icon;
    String idRol;
    Rol({
        this.idSidebar,
        this.nombre,
        this.path,
        this.icon,
        this.idRol,
    });



    factory Rol.fromJson(Map<String, dynamic> json) => Rol(
        idSidebar: json["id_sidebar"] is int ? json['id_sidebar'].toString() : json["id_sidebar"],
        nombre: json["nombre"],
        path: json["path"],
        icon: json["icon"],
        idRol: json["id_rol"],
    );

    Map<String, dynamic> toJson() => {
        "id_sidebar": idSidebar,
        "nombre": nombre,
        "path": path,
        "icon": icon,
        "id_rol": idRol,
    };
}
