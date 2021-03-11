import 'package:flutter/material.dart';
import 'package:flutter_ejemplos/src/pages/model/models/user_list.dart';
import 'package:flutter_ejemplos/src/pages/model/widgets/user_listTile_widget.dart';

class UserListWidget extends StatelessWidget {
  final UserList userList;

  const UserListWidget({@required this.userList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: userList.length,
      itemBuilder: (context, index) =>
          UserListTileWidget(user: userList.users[index]),
    );
  }
}
