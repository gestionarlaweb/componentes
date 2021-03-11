import 'package:flutter/material.dart';
import 'package:flutter_ejemplos/src/theme/theme_base.dart';

Widget cardTipo1() {
  return Card(
    elevation: 10.0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
    child: Column(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.photo_album, color: Colors.blue),
          title: Text(
            'Soy el Card tipo 1',
            style: kTextApp,
          ),
          subtitle: Text(
            'Aquí estamos con la descripción de la tarjeta para que podaís ver lo largo que soy.',
            style: kTextApp,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            TextButton(
              child: Text('Cancelar', style: kTextApp),
              onPressed: () {},
            ),
            TextButton(
              child: Text('Ok', style: kTextApp),
              onPressed: () {},
            ),
          ],
        )
      ],
    ),
  );
}
