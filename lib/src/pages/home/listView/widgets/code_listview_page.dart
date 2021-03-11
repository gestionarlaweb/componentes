import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

const String _text = """
## ListView

ListView & ListView.builder
```
class _ListPageState extends State<ListPage> {

  int total = 1;

  @override
  Widget build(BuildContext context) {
    .............
    .............
body: _crearLista(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            total = total + 1;
          });
        },
      ),
    );
  }

  Widget _crearLista() {
    // método encargado de redibujar los métodos de la lista
    return ListView.builder(
      itemCount: total,
      itemBuilder: (BuildContext context, int index) {
        return FadeInImage(
          image: NetworkImage('https://picsum.photos/seed/picsum/500/300'),
          placeholder: AssetImage('assets/jar-loading.gif'),
        );
      },
    );
  }
    
```

""";

class CodeListViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();

    return Scaffold(
      appBar: AppBar(
        title: Text('ListView Code'),
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
