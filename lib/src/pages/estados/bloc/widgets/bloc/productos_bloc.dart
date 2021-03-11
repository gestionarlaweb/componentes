// Propiedades, métodos, getters, setters....
// Los Blocs se comunican con los ficheros externos a través de Streams

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
