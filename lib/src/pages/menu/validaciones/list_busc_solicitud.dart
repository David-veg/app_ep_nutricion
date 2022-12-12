import 'package:flutter/material.dart';

class Bus_solicitud extends StatefulWidget {
  const Bus_solicitud({Key key}) : super(key: key);

  @override
  State<Bus_solicitud> createState() => _Bus_solicitudState();
}

class _Bus_solicitudState extends State<Bus_solicitud> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: 
      Text('busqueda de solicitudes')
      ),
    );
  }
}