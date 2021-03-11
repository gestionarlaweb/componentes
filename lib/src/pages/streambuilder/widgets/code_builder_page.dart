import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

const String _text = """
## StreamController

- import 'dart:async';
```
class _StreamBuilderPageState extends State<StreamBuilderPage> {
  // StreamController
  final colorStream = new StreamController<Color>();
  int counter = -1;
  final List<Color> colorList = [
    Colors.blue,
    Colors.amber,
    Colors.yellowAccent
  ];
```
Para que destruya el Stream al finalizar 
```
  @override
  void dispose() {
    colorStream.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      .....
```

```
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
```

""";

class CodeBuilderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();

    return Scaffold(
      appBar: AppBar(
        title: Text('StreamBuilder Code'),
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
