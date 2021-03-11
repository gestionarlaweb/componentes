import 'package:flutter_ejemplos/src/pages/model/models/user.dart';

class UserList {
  List<User> _users;

  UserList(this._users);

  List<User> get users => _users;
  int get length => _users.length;
}

final UserList model = UserList([
  User('david', 'david@gmail.com'),
  User('david2', 'david2@gmail.com'),
  User('david3', 'david3@gmail.com'),
]);
