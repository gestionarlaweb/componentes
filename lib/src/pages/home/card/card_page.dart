import 'package:flutter/material.dart';
import 'package:flutter_ejemplos/src/pages/home/card/widgets/card_tipo1.dart';
import 'package:flutter_ejemplos/src/pages/home/card/widgets/card_tipo2.dart';
import 'package:flutter_ejemplos/src/pages/home/card/widgets/code_card_page.dart';
import 'package:flutter_ejemplos/src/theme/theme_base.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Page', style: kTextAppBar),
        actions: [
          IconButton(
            icon: Icon(Icons.code, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return CodeCardPage();
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          cardTipo1(),
          cardTipo2(),
        ],
      ),
    );
  }
}
