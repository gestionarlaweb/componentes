import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

const String _text = """
## Card

Card tipo 1
```
Widget cardTipo1() {
  return Card(
    elevation: 10.0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
    child: Column(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.photo_album, color: Colors.blue),
          title: Text('Soy el Card tipo 1'),
          subtitle: Text(
              'Aquí estamos con la descripción de la tarjeta para que podaís ver lo largo que soy.'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {},
            ),
            TextButton(
              child: Text('Ok'),
              onPressed: () {},
            ),
          ],
        )
      ],
    ),
  );
}

```

Card tipo 2
```
Widget cardTipo2() {
  final card = Container(
    // clipBehavior: Clip.antiAlias, //
    child: Column(
      children: <Widget>[
        FadeInImage(
          image: NetworkImage(
              'https://loadedlandscapes.com/wp-content/uploads/2019/07/lighting.jpg'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 200),
          height: 250.0,
          fit: BoxFit.cover, // Como debe de ocupar el espacio que tiene
        ),
        
        Container(
          padding: EdgeInsets.all(10.0),
          child: Text('Soy el Card Tipo 2'),
        )
      ],
    ),
  );

  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
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

```
""";

class CodeCardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Card Code'),
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
