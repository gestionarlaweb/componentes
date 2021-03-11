import 'package:flutter/material.dart';
import 'package:flutter_ejemplos/src/pages/home/alert/alert_page.dart';
import 'package:flutter_ejemplos/src/pages/home/avatar/avatar_page.dart';
import 'package:flutter_ejemplos/src/pages/home/card/card_page.dart';
import 'package:flutter_ejemplos/src/pages/home/inputs/input_page.dart';
import 'package:flutter_ejemplos/src/pages/home/listView/listview_page.dart';
import 'package:flutter_ejemplos/src/pages/home/slider/slider_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final pageRoutesComponents = <_Route>[
  _Route(FontAwesomeIcons.exclamationTriangle, 'Alertas', AlertPage()),
  _Route(FontAwesomeIcons.userCircle, 'Avatar', AvatarPage()),
  _Route(FontAwesomeIcons.addressCard, 'Card', CardPage()),
  _Route(FontAwesomeIcons.keyboard, 'Input', InputPage()),
  _Route(FontAwesomeIcons.slidersH, 'Sliders', SliderPage()),
  _Route(FontAwesomeIcons.list, 'Listas', ListPage()),
];

class _Route {
  final IconData icon;
  final String titulo;
  final Widget ruta;

  _Route(this.icon, this.titulo, this.ruta);
}
