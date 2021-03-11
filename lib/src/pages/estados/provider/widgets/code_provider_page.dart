import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

const String _text = """
## Provider

### Creación de nuestro clase Provider.
- provider: ^4.3.3
- import 'package:provider/provider.dart';

```
class InfoProvider with ChangeNotifier {
  String _boton = 'Amarillo';
  Color colorBase = Colors.yellowAccent;

  get boton {
    return _boton;
  }

  set boton(String nombre) {
    this._boton = nombre;
    this.colorBase =
        (nombre == 'Amarillo') ? Colors.yellowAccent : Colors.redAccent;
    notifyListeners();
  }
}
```

Declaración desde lo más ariba del Arbol de Widgets

En este caso declaramos un 
- MultiProvider 
en vez de un
- ChangeNotifierProvider por si más adelante queremos declarar más de uno y cada uno con sus funciones:

 Providers
(* provider1.dart)
(* provider2.dart)

```
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<InfoProvider>(
          create: (context) {
            return InfoProvider();
          },
        )
      ],
      child: MaterialApp( .....
```

Instanciar el Provoder donde lo necesitemos
```
final botonInfo = Provider.of<InfoProvider>(context);
```

Llamada al SET jugador y le pasa el nuevo valor
```
onPressed: () => botonInfo.boton = 'Amarillo'),
```

Consumer para si tenemos que utilizar más veces esa instancia,
no hará falta declarar previamente la instancia, ya que la declararemos de otra forma dentro del Consumer
- final botonInfo = Provider.of<InfoProvider>(context); 
- 'botonInfo' 
```
Consumer<InfoProvider>(
          builder: (context, botonInfo, _) => Center(
            child: Text(
              'El botón seleccionado es {botonInfo.boton}',
              style: TextStyle(
                fontSize: 20.0,
                color: botonInfo.colorBase,
```
""";

class CodeProviderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Gestor de estados Provider'),
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
