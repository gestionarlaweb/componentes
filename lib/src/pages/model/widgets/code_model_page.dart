import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

const String _text = """
## Modelo en dart sin dependencias

- class User (user.dart)
```
class User {
  String _username, _email;  
  User(this._username, this._email);

  String get username => _username;  // Obtenemos un username
  String get email => _email;
}
```
- class UserList (user_list.dart)
```
class UserList {
  List<User> _users;      
  UserList(this._users);

  List<User> get users => _users;   // Obtenemos una Lista de la clase User
  int get length => _users.length;
}
```
- Modelo (user_list_model.dart)
```
final UserList model = UserList([
  User('david', 'david@gmail.com'),
  User('david2', 'david2@gmail.com'),
  User('david3', 'david3@gmail.com'),
]);
```
Estraemos los datos del modelo a un ListTile (user_listTile_widget.dart)
```
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
```
Cargamos el listado (user_list_widget)
```
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
```
En la página principal (model_page.dart) llamamos a ese modelo final
```
 ),
      body: UserListWidget(
        userList: model,
      ),
```
....esto es lo que va a cargar ese modelo.....
```
final UserList model = UserList([
  User('david', 'david@gmail.com'),
  User('david2', 'david2@gmail.com'),
  User('david3', 'david3@gmail.com'),
]);
```

""";

class CodeModelPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Model Code'),
      ),
      body: SafeArea(
        child: Markdown(
          controller: controller,
          selectable: true,
          data: _text,
        ),
      ),
    );
  }
}
