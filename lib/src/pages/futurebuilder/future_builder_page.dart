import 'package:flutter/material.dart';
import 'package:flutter_ejemplos/src/pages/futurebuilder/widgets/code_future_page.dart';
import 'package:flutter_ejemplos/src/pages/futurebuilder/widgets/models/response_model.dart';
import 'package:flutter_ejemplos/src/theme/theme_base.dart';
import 'package:http/http.dart' as http;
import 'package:animate_do/animate_do.dart';

Future<Respuesta> getUsuarios() async {
  final resp = await http.get('https://reqres.in/api/users');
  return respuestaFromJson(resp.body);
}

class FutureBuilderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FutureBuilder Page', style: kTextAppBar),
        actions: [
          IconButton(
            icon: Icon(Icons.code, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return CodeFuturePage();
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: getUsuarios(),
        builder: (BuildContext context, AsyncSnapshot<Respuesta> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            return _ListaUsuarios(snapshot.data.data);
          }
        },
      ),
    );
  }
}

class _ListaUsuarios extends StatelessWidget {
  final List<Usuario> usuarios;
  _ListaUsuarios(this.usuarios);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: usuarios.length,
      itemBuilder: (BuildContext context, int i) {
        final usuario = usuarios[i];
        return FadeIn(
          delay: Duration(milliseconds: 150 * i),
          child: ListTile(
            title: Text('${usuario.firstName} ${usuario.lastName}'),
            subtitle: Text(usuario.email),
            trailing: Image.network(usuario.avatar),
          ),
        );
      },
    );
  }
}
