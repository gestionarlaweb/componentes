import 'package:flutter/material.dart';
import 'package:flutter_ejemplos/src/pages/home/inputs/widgets/code_inputs_page.dart';
import 'package:flutter_ejemplos/src/theme/theme_base.dart';
//import 'package:intl/intl.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = '';
  String _email = '';
  //String _fecha = '';

  List<String> _lenguajes = ['C#', 'React', 'Dart'];
  String _opcionSeleccionada = 'C#';

// para la fecha
  //TextEditingController _inputDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs de texto', style: kTextAppBar),
        actions: [
          IconButton(
            icon: Icon(Icons.code, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return CodeInputsPage();
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          // Divider(),
          // _crearFecha(context),
          Divider(),
          _crearDropdown(),
          Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      // autofocus: true,

      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        counter: Text('Letras ${_nombre.length}'),
        labelText: 'Nombre',
        hintText: 'Nombre a introducir',
        helperText: 'Solo el nombre',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle),
      ),
      onChanged: (valor) {
        setState(() {
          _nombre = valor;
        });
      },
    );
  }

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

  // Widget _crearFecha(BuildContext context) {
  //   return TextField(
  //     enableInteractiveSelection: false,
  //     // Controlador
  //     controller: _inputDateController,
  //     //
  //     decoration: InputDecoration(
  //       border: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(20.0),
  //       ),
  //       labelText: 'Fecha de nacimiento',
  //       hintText: 'Tu fecha de nacimiento',
  //       suffixIcon: Icon(Icons.perm_contact_calendar),
  //       icon: Icon(Icons.calendar_today),
  //     ),
  //     onTap: () {
  //       // Quitar el focus
  //       FocusScope.of(context).requestFocus(new FocusNode());
  //       //_selectDate(context);
  //     },
  //   );
  // }

  // _selectDate(BuildContext context) async {
  //   DateTime picked = await showDatePicker(
  //       context: context,
  //       initialDate: new DateTime.now(),
  //       firstDate: new DateTime(2020),
  //       lastDate: new DateTime(2023),
  //       locale: Locale('es', 'ES'));
  //   if (picked != null) {
  //     setState(() {
  //      // _fecha = picked.toString();

  //       // Utlizamos DateFormat para obtener una fecha legible (intl.dart)
  //       //_inputDateController.text = DateFormat('dd-MM-yyyy').format(picked);

  //      // _inputDateController.text = _fecha;
  //     });
  //   }
  // }

  List<DropdownMenuItem<String>> getOpcionesDropdown() {
    // Inicializamos
    List<DropdownMenuItem<String>> lista = [];
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
        Icon(Icons.computer_rounded),
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

  Widget _crearPersona() {
    return Column(
      children: [
        ListTile(
          title: Text('Nombre : $_nombre'),
          subtitle: Text('Email: $_email'),
          trailing: Text(_opcionSeleccionada),
        ),
        // ListTile(
        //   title: Text('Fecha : $_fecha'),
        // ),
      ],
    );
  }
}
