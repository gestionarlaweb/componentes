import 'package:flutter/material.dart';
import 'package:flutter_ejemplos/src/pages/home/listView/widgets/code_listview_page.dart';
import 'package:flutter_ejemplos/src/theme/theme_base.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  int total = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List', style: kTextAppBar),
        actions: [
          IconButton(
            icon: Icon(Icons.code, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return CodeListViewPage();
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: _crearLista(),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: kColorButton,
        ),
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
}
