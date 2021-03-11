import 'package:flutter/material.dart';

class InfoProvider with ChangeNotifier {
  String _boton = 'Amarillo';
  Color colorBase = Colors.yellowAccent;

  get boton {
    return _boton;
  }

  set boton(String nombre) {
    this._boton = nombre;
    this.colorBase =
        (nombre == 'Amarillo') ? Colors.yellowAccent : Colors.redAccent;
    notifyListeners();
  }
}
