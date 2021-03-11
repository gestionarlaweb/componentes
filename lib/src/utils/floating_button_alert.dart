import 'package:flutter/material.dart';
import 'package:flutter_ejemplos/src/theme/theme_base.dart';

class MyFloatingButtonAlert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          child: Icon(
            Icons.exit_to_app_outlined,
            color: kColorButton,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
