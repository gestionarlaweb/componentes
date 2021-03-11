import 'package:flutter/material.dart';
import 'package:flutter_ejemplos/src/theme/theme_base.dart';

Widget cardTipo2() {
  final card = Container(
    // clipBehavior: Clip.antiAlias, //
    child: Column(
      children: <Widget>[
        FadeInImage(
          image: NetworkImage(
              'https://ep01.epimg.net/elpais/imagenes/2020/08/28/eps/1598638303_049709_1598638551_noticia_normal.jpg'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 200),
          height: 250.0,
          fit: BoxFit.cover, // Como debe de ocupar el espacio que tiene
        ),
        Container(
          padding: EdgeInsets.all(10.0),
          child: Text(
            'Soy el Card Tipo 2',
            style: kTextApp,
          ),
        )
      ],
    ),
  );

  return Container(
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.0),
        //color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              spreadRadius: 2.0,
              offset: Offset(2.0, 5.0))
        ]),
    child: ClipRRect(
      // Nos permite recortar
      borderRadius: BorderRadius.circular(30.0),
      child: card,
    ),
  );
}
