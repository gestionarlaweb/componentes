import 'package:flutter/material.dart';
import 'package:flutter_ejemplos/src/pages/estados/bloc/widgets/bloc/productos_bloc.dart';
import 'package:flutter_ejemplos/src/pages/estados/bloc/widgets/code_bloc_page.dart';
import 'package:flutter_ejemplos/src/theme/theme_base.dart';

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
            return Text('Productos : ${snapshot.data ?? 0}',
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
              .getProductos, // llamada a esa inicialización apuntando a la clase del Bloc
          builder: (context, AsyncSnapshot snapshot) {
            // Ver que es lo que hay en esa inicialización que ejecuta el YIELD de esa clase getProductos
            //print(snapshot.data);
            // Si es null (que lo es la primera vez) me devuelves un arreglo vacío.
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
