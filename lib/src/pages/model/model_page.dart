import 'package:flutter/material.dart';
import '../model/models/user_list.dart';
import '../model/widgets/code_model_page.dart';
import '../model/widgets/user_list_widget.dart';
import 'package:flutter_ejemplos/src/theme/theme_base.dart';

class ModelPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modelos de datos', style: kTextAppBar),
        actions: [
          IconButton(
            icon: Icon(Icons.code, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Container(
                      child: CodeModelPage(),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: UserListWidget(
        userList: model,
      ),
    );
  }
}
