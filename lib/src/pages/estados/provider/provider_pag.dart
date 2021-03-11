import 'package:flutter/material.dart';
import 'package:flutter_ejemplos/src/pages/estados/provider/widgets/code_provider_page.dart';
import 'package:flutter_ejemplos/src/pages/estados/provider/widgets/providers/info_provider.dart';
import 'package:flutter_ejemplos/src/pages/estados/provider/widgets/view_button_page.dart';
import 'package:flutter_ejemplos/src/pages/estados/provider/widgets/view_text_page.dart';
import 'package:flutter_ejemplos/src/theme/theme_base.dart';
import 'package:provider/provider.dart';

class ProviderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Pasar a una variable la instancia de Provider
    final botonInfo = Provider.of<InfoProvider>(context);
    //
    return Scaffold(
      appBar: AppBar(
        //
        title: Text(botonInfo.boton, style: kTextAppBar),
        actions: [
          IconButton(
            icon: Icon(Icons.code, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Container(
                      child: CodeProviderPage(),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: ViewTextPage(),
      floatingActionButton: ViewButtonPage(),
    );
  }
}
