import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

const String _text = """
## Bloc

### Creación de nuestro clase Provider.
- provider: ^4.3.3
- import 'package:provider/provider.dart';

Nuestro Bloc
```
import 'dart:async';

const PRODUCTOS = ['Cocacola', 'Lecha', 'Fruta'];

class ProductosBloc {
  // El async regresa un Future que devolverá un RETURN
  // El async* no regresa un Future sinó un Stream que devolverá un YIELD
  Stream<List<String>> get getProductos async* {
    final List<String> productos = [];
    for (String producto in PRODUCTOS) {
      await Future.delayed(Duration(seconds: 1));
      // Méteme el listado de PRODUCTOS que paso uno por uno al String producto al List productos
      productos.add(producto);
      yield productos;
    }
  }

  StreamController<int> _productosContador = new StreamController<int>();

  Stream<int> get productosContador => _productosContador.stream;

  ProductosBloc() {
    this.getProductos.listen(
        (productosList) => this._productosContador.add(productosList.length));
  }

  // dispose
  destruye() {
    _productosContador.close();
  }
}

```

Página a mostrar

```
class BlocPage extends StatelessWidget {
  // Inicializanmos nuestro BLOC -ProductosBloc()-
  final productosBloc = new ProductosBloc();

  void dispose() {
    productosBloc.destruye();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // StreamBuiler - BLOC
        title: StreamBuilder(
          stream: productosBloc.productosContador,
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            return Text('Productos : {snapshot.data ?? 0}',
                style: kTextAppBar); // Si es null devuelve 0
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.code, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Container(
                      child: CodeBlocPage(),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: StreamBuilder<Object>(
          // StreamBuiler - BLOC
          stream: productosBloc
              .getProductos, 
          builder: (context, AsyncSnapshot snapshot) {
           
            final productos = snapshot.data ?? [];
            return ListView.builder(
              itemCount: productos.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                    productos[index],
                    style: kTextApp,
                  ),
                );
              },
            );
          }),
    );
  }
}
```
 
""";

class CodeBlocPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Gestor de estados Bloc'),
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
