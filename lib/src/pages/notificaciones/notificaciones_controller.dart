import 'package:flutter/material.dart';
import 'package:app_nutricion_ep/src/utils/constants/shared_prefer.dart';

class Notificaciones_Controller {
  BuildContext context;
  SharedPref _sharedPref = new SharedPref();
  Future init(BuildContext context) {
    this.context = context;
  }

  logout() {
    _sharedPref.logout(context);
  }
}
