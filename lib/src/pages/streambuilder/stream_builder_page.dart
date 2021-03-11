import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ejemplos/src/pages/streambuilder/widgets/code_builder_page.dart';
import 'package:flutter_ejemplos/src/theme/theme_base.dart';

class StreamBuilderPage extends StatefulWidget {
  @override
  _StreamBuilderPageState createState() => _StreamBuilderPageState();
}

class _StreamBuilderPageState extends State<StreamBuilderPage> {
  // StreamController
  final colorStream = new StreamController<Color>();
  int counter = -1;
  final List<Color> colorList = [
    Colors.blue,
    Colors.amber,
    Colors.yellowAccent
  ];

// Para que destruya el Stream al finalizar
  @override
  void dispose() {
    colorStream.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamBuilder Page', style: kTextAppBar),
        actions: [
          IconButton(
            icon: Icon(Icons.code, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return CodeBuilderPage();
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: StreamBuilder(
          stream: colorStream.stream,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            //  Si no devuelve nada
            if (!snapshot.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Cargando data'),
                  SizedBox(height: 20.0),
                  CircularProgressIndicator(),
                ],
              );
            }
            // Cuando termina con un close
            if (snapshot.connectionState == ConnectionState.done) {
              return Text(
                'fin del Stream !',
                style: kTextApp,
              );
            }

            // ejecuta el Stream
            return Container(
              height: 150.0,
              width: 150.0,
              color: snapshot.data,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.color_lens),
        onPressed: () {
          // Enviar al Stream
          counter++; // 0
          if (counter < colorList.length) {
            colorStream.sink.add(colorList[counter]); // 0,1,2
          } else {
            colorStream.close();
          }
        },
      ),
    );
  }
}
