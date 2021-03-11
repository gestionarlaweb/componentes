import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_ejemplos/src/pages/home/slider/widgets/code_slider_page.dart';
import 'package:flutter_ejemplos/src/pages/home/slider/widgets/functions_slider_page.dart';
import 'package:flutter_ejemplos/src/theme/theme_base.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 100.0;
  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider', style: kTextAppBar),
        actions: [
          IconButton(
            icon: Icon(Icons.code, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Container(
                      child: CodeSliderPage(),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            FunctionsSliderPage(),
            _checkBox(),
            _crearSwitch(),
            _image(),
            _slider()
          ],
        ),
      ),
    );
  }

  _checkBox() {
    return CheckboxListTile(
      title: Text(
        'Bloquear Slider',
        style: kTextApp,
      ),
      value: _bloquearCheck,
      onChanged: (valor) {
        setState(() {
          valor = _bloquearCheck;
        });
      },
    );
  }

  _crearSwitch() {
    return SwitchListTile(
      title: Text('Bloquear Slider', style: kTextApp),
      value: _bloquearCheck,
      onChanged: (valor) {
        setState(() {
          _bloquearCheck = valor;
        });
      },
    );
  }

  _image() {
    return Image(
      image: NetworkImage(
          'https://ep01.epimg.net/elpais/imagenes/2020/08/28/eps/1598638303_049709_1598638551_noticia_normal.jpg'),
      width: _valorSlider,
      fit: BoxFit.contain, // Para que se vean bien los margenes
    );
  }

  _slider() {
    return Slider(
      value: _valorSlider,
      min: 10.0,
      max: 200.0,
      label: "Select",
      activeColor: Colors.indigoAccent,
      inactiveColor: Colors.amberAccent,
      divisions: 30,
      onChanged: (_bloquearCheck)
          ? null
          : (valor) {
              setState(() {
                _valorSlider = valor;
              });
            },
    );
  }
}
