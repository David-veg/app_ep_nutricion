import 'package:app_nutricion_ep/src/models/solicitudes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:app_nutricion_ep/src/pages/menu/solicitudes/list_solicitudes_controller.dart';
import 'package:app_nutricion_ep/src/utils/constants/my_colors.dart';
import 'package:app_nutricion_ep/src/provider/solicitudes_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class List_solicitudes extends StatefulWidget {
  const List_solicitudes({Key key}) : super(key: key);

  @override
  State<List_solicitudes> createState() => _List_solicitudesState();
}

class _List_solicitudesState extends State<List_solicitudes> {
  List_SolicitudesController _con = new List_SolicitudesController();
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
    return DefaultTabController(
      length: _con.categoria?.length,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Color.fromRGBO(2, 48, 82, 1),
            /* leading:  */
            actions: [_notify()],
            bottom: TabBar(
              indicatorColor: MyColors.primaryColor,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey[400],
              isScrollable: true,
              tabs: List<Widget>.generate(_con.categoria.length, (index) {
                return Tab(
                  child: 
                  Text(_con.categoria[index] ?? ''),
                );
              }),
            ),
          ),
          
        ),
        body: TabBarView(
          children: _con.categoria.map((String category) {
            return _cardList(null);
          }).toList(),
        ),
      ),
    );
  }

  Widget _filtro() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        decoration: InputDecoration(
            hintText: 'Buscar',
            suffixIcon: Icon(
              Icons.search,
              color: Colors.grey[400],
            ),
            hintStyle: TextStyle(fontSize: 17, color: Colors.grey[500]),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: Colors.grey[300])),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: Colors.grey[300])),
            contentPadding: EdgeInsets.all(15)),
      ),
    );
  }

  Widget _cardList(Solicitud solicitud) {
    return Container(
      height: 160,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Card(
        elevation: 3.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
          ),
          child: Stack(
            children: [
              Positioned(
                child: Container(
                  height: 30,
                  width: 15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    color: MyColors.primaryColor
                  ),
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text('Solicitud #0',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontFamily: 'NimbusSans'
                    )
                    ),
                    
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top:40, left: 20, right:20 ),
                child: Column(
                  children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.symmetric(vertical: 5),
                        width: double.infinity,
                        child: Text('nombre: jose david',
                        style: TextStyle(
                          fontSize: 13

                         ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.symmetric(vertical: 5),
                        width: double.infinity,
                        child: Text('Apellido: Vega Vega',
                        style: TextStyle(
                          fontSize: 13

                         ),
                         maxLines: 1,
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.symmetric(vertical: 5),
                        width: double.infinity,
                        child: Text('codigo: 201820035',
                        style: TextStyle(
                          fontSize: 13

                         ),
                         maxLines: 2,
                        ),
                      ),
                  ],
                ),
              )
            ],
          ),
      ),
    );
  }

  Widget _notify() {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(right: 15, top: 13),
          child: Icon(
            Icons.notifications,
            color: Colors.white,
          ),
        ),
        Positioned(
            right: 16,
            top: 15,
            child: Container(
              width: 9,
              height: 9,
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(Radius.circular(30))),
            ))
      ],
    );
  }
}
