import 'package:flutter/material.dart';
import 'package:flutter_ejemplos/src/pages/model/models/user.dart';

class UserListTileWidget extends StatelessWidget {
  final User user;

  const UserListTileWidget({@required this.user});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.person),
      title: Text(user.username),
      subtitle: Text(user.email),
    );
  }
}
