import 'package:flutter/material.dart';
import 'package:flutter_ejemplos/src/pages/estados/provider/widgets/providers/info_provider.dart';
import 'package:provider/provider.dart';

class ViewButtonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
// Provider
    final botonInfo = Provider.of<InfoProvider>(context);

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
              heroTag: "btn1",
              child: Icon(Icons.next_plan_outlined),
              backgroundColor: Colors.yellowAccent,
              // llamada al SET jugador y le pasa el nuevo valor
              onPressed: () => botonInfo.boton = 'Amarillo'),
          SizedBox(
            height: 20.0,
          ),
          FloatingActionButton(
              heroTag: "btn2",
              child: Icon(Icons.import_export_rounded),
              backgroundColor: Colors.redAccent,
              // llamada al SET jugador y le pasa el nuevo valor
              onPressed: () => botonInfo.boton = 'Rojo'),
        ],
      ),
    );
  }
}
