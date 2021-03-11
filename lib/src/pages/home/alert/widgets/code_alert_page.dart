import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

const String _text = """
## AlertDialog
Llamada desde el onPressed :

```
body: Center(
        child: RaisedButton(
          child: Text('Mostrar Alerta'),
          color: Colors.blue,
          textColor: Colors.white,
          shape: StadiumBorder(),
          onPressed: () {
            buildShowDialog(context);
          },
        ),
      ),
```

Función showDialog
```
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

```
""";

class CodeAlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Code'),
      ),
      body: SafeArea(
        child: Markdown(
          controller: controller,
          selectable: true,
          data: _text,
        ),
      ),
    );
  }
}
