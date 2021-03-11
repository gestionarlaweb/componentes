import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

const String _text = """
## Slider & Check

Partimos de un StatefulWidget porque va a cambiar el state.

- Inicializamos el Slider
```
double _valorSlider = 100.0;

```

- Creamos els Slider
```
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
```

- Creamos el código de la imagen
```
Image _image() {
    return Image(
      image: NetworkImage(
          'https://i.picsum.photos/id/221/200/300.jpg?hmac=vFrrajnPFCrr5ttjepVTsUDWzoo-orpnXOsqdqAd0LU'),
      width: _valorSlider,
      fit: BoxFit.contain, // Para que se vean bien los margenes
    );
  }
```
- Inicializamos el CheckBox
```
bool _bloquearCheck = false;
```
### CheckboxListTile
```
_checkBox() {
    return CheckboxListTile(
      title: Text('Bloquear Slider'),
      value: _bloquearCheck,
      onChanged: (valor) {
        setState(() {
          _bloquearCheck = valor;
        });
      },
    );
  }
```
### SwitchListTile
```
_crearSwitch() {
    return SwitchListTile(
      title: Text('Bloquear Slider'),
      value: _bloquearCheck,
      onChanged: (valor) {
        setState(() {
          _bloquearCheck = valor;
        });
      },
    );
  }
```
""";

class CodeSliderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Slider Code'),
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
