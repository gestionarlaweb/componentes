import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

const String _text = """
## Inputs

Inputs básicos
```
Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        labelText: 'Email',
        hintText: 'Dirección email',
        helperText: 'Solo email',
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email),
      ),
      onChanged: (valor) {
        setState(() {
          _email = valor;
        });
      },
    );
  }

  Widget _crearPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        labelText: 'Password',
        hintText: 'Tu password',
        helperText: 'Solo password',
        suffixIcon: Icon(Icons.lock_open),
        icon: Icon(Icons.lock),
      ),
    );
  }
 
```
Dropdown
```
List<String> _lenguajes = ['C#', 'React', 'Dart'];
  String _opcionSeleccionada = 'C#';

List<DropdownMenuItem<String>> getOpcionesDropdown() {
    // Inicializamos
    List<DropdownMenuItem<String>> lista = new List();
    _lenguajes.forEach((lenguaje) {
      lista.add(DropdownMenuItem(
        child: Text(lenguaje),
        value: lenguaje,
      ));
    });
    return lista;
  }

  Widget _crearDropdown() {
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(
          width: 30.0,
        ),
        Expanded(
          child: DropdownButton(
            value: _opcionSeleccionada,
            items: getOpcionesDropdown(),
            onChanged: (opt) {
              setState(() {
                _opcionSeleccionada = opt;
              });
            },
          ),
        ),
      ],
    );
  }

```


""";

class CodeInputsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs Code'),
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
