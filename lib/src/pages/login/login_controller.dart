import 'package:app_nutricion_ep/src/models/rol.dart';
import 'package:flutter/material.dart';
import 'package:app_nutricion_ep/src/models/response_api.dart';
import 'package:app_nutricion_ep/src/models/usuario.dart';
import 'package:app_nutricion_ep/src/provider/users_provider.dart';
import 'package:app_nutricion_ep/src/utils/constants/shared_prefer.dart';
import 'package:app_nutricion_ep/src/utils/constants/snackbar.dart';

class LoginController {
  BuildContext context;
  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  UsersProvaider usersProvaider = new UsersProvaider();
  SharedPref _sharedPref = new SharedPref();

  Future init(BuildContext context) async {
    this.context = context;
    await usersProvaider.init(context);

    Usuario usuario = Usuario.fromJson(await _sharedPref.read('usuario') ?? {});

    print('usuario: ${usuario.toJson()}');

    if (usuario?.sessionToken != null) {
      Navigator.pushNamedAndRemoveUntil(
          context, 'client/solicitudes/list', (route) => false);
    }
  }


  void login() async {
    String username = usernameController.text.trim();
    String password = passwordController.text.trim();

    ResponseApi responseApi = await usersProvaider.Login(username, password);
    print('Respuesta object: ${responseApi}');
    print('Respuesta: ${responseApi.toJson()}');
    if (responseApi.success) {
      Usuario usuario = Usuario.fromJson(responseApi.data);
      _sharedPref.save('usuario', usuario.toJson());

  /*     print('usuario loguedo: ${usuario.toJson()}'); */
      /* if (usuario.sidebar.length > 1){
        Navigator.pushNamedAndRemoveUntil(context, 'sidebar', (route) => false);
      } */
      /* else{
        // ignore: use_build_context_synchronously
        Navigator.pushNamedAndRemoveUntil(context, usuario.sidebar[0].path , (route) => false);
      }   */  
      Navigator.pushNamedAndRemoveUntil(context, 'solicitudesAdm', (route) => false);
    } else {
      MySnackbar.show(context, responseApi.message);
    }

   
  }
  //null safety
}
