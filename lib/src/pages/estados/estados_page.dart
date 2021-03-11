import 'package:flutter/material.dart';
import 'package:flutter_ejemplos/src/routes/routes_components.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EstadosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes básicos'),
      ),
      body: _Lista(),
    );
  }
}

class _Lista extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, i) => Divider(
        color: Colors.blue,
      ),
      itemCount: pageRoutesComponents.length,
      itemBuilder: (context, i) => ListTile(
        leading: FaIcon(
          pageRoutesComponents[i].icon,
          color: Colors.blue,
        ),
        title: Text(pageRoutesComponents[i].titulo),
        trailing: Icon(Icons.chevron_right, color: Colors.blue),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => pageRoutesComponents[i].ruta));
        },
      ),
    );
  }
}
