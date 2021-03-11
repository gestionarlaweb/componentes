import 'package:flutter/material.dart';
import 'package:flutter_ejemplos/src/pages/home/home_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final pageRoutesEstados = <_Route>[
  _Route(FontAwesomeIcons.exclamationTriangle, 'Alertas', HomePage()),
];

class _Route {
  final IconData icon;
  final String titulo;
  final Widget ruta;

  _Route(this.icon, this.titulo, this.ruta);
}
