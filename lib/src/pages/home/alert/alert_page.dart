import 'package:flutter/material.dart';
import 'package:flutter_ejemplos/src/pages/home/alert/widgets/code_alert_page.dart';
import 'package:flutter_ejemplos/src/pages/home/alert/widgets/show_dialog.dart';
import 'package:flutter_ejemplos/src/theme/theme_base.dart';
import 'package:flutter_ejemplos/src/utils/floating_button_alert.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page', style: kTextAppBar),
        actions: [
          IconButton(
            icon: Icon(Icons.code, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return CodeAlertPage();
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Mostrar Alerta', style: kTextApp),
          onPressed: () {
            buildShowDialog(context);
          },
        ),
      ),
      floatingActionButton: MyFloatingButtonAlert(),
    );
  }
}
