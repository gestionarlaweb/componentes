import 'package:flutter/material.dart';

Future buildShowDialog(BuildContext context) {
  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return AlertDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        title: Text('Título'),
        content: Column(
          mainAxisSize: MainAxisSize.min, // Que se adapte al contenido interno
          children: <Widget>[
            Text('Este es el contenido de la caja de la alerta !'),
            FlutterLogo(size: 100.0)
          ],
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Cancelar'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: Text('ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      );
    },
  );
}
