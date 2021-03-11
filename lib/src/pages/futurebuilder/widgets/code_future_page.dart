import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

const String _text = """
## FutureBuilder
### http: ^0.13.0 
- import 'package:../code_future_page.dart';
- import 'package:http/http.dart' as http;

### (future_builder_page.dart)
```
Future<Respuesta> getUsuarios() async {
  final resp = await http.get('https://reqres.in/api/users');
  return respuestaFromJson(resp.body);
}
```
- Esto hace referencia a nuestro modelo creado en un fichero independiente
### (response_model.dart)
```
Respuesta respuestaFromJson(String str) => Respuesta.fromJson(json.decode(str));

String respuestaToJson(Respuesta data) => json.encode(data.toJson());

class Respuesta {
  Respuesta({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.data,
    this.support,
  });

  int page;
  int perPage;
  int total;
  int totalPages;
  List<Usuario> data;
  Support support;
.....

```
### Siguiendo con nuestro (future_builder_page.dart)
```
class FutureBuilderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      .....
      body: FutureBuilder(
        future: getUsuarios(),
        builder: (BuildContext context, AsyncSnapshot<Respuesta> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            return _ListaUsuarios(snapshot.data);
          }
        },
      ),
```
- class _ListaUsuarios
```
class _ListaUsuarios extends StatelessWidget {
  final List<Usuario> usuarios;
  _ListaUsuarios(this.usuarios);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: usuarios.length,
      itemBuilder: (BuildContext context, int i) {
        final usuario = usuarios[i];
        return ListTile(
          title: Text('{ usuario.firstName} {usuario.lastName}'),
          subtitle: Text(usuario.email),
          trailing: Image.network(usuario.avatar),
        );
      },
    );
  }
}

```


""";

class CodeFuturePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();

    return Scaffold(
      appBar: AppBar(
        title: Text('FutureBuilder Code'),
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
