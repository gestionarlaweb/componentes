import 'package:flutter/material.dart';
import 'package:flutter_ejemplos/src/pages/estados/provider/widgets/providers/info_provider.dart';
import 'package:provider/provider.dart';

class ViewTextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // Provider
        Consumer<InfoProvider>(
          builder: (context, botonInfo, _) => Center(
            child: Text(
              'El botón seleccionado es ${botonInfo.boton}',
              style: TextStyle(
                fontSize: 20.0,
                color: botonInfo.colorBase,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
