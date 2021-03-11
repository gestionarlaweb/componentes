import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

const String _text = """
## Mapbox

- mapbox_gl: ^0.7.0 
### Android
- minSdkVersion 20
### iOs
<key>io.flutter.embedded_views_preview</key>
<true/>
<key>MGLMapboxAccessToken</key>
<string>YOUR_TOKEN_HERE</string>
```
(AndroidManifest.xml)
<meta-data android:name="com.mapbox.token" android:value="YOUR_TOKEN_HERE" />
```
- Opcional
```
<key>NSLocationWhenInUseUsageDescription</key>
<string>[Your explanation here]</string>
```
- Lo necesario:
```
import 'package:mapbox_gl/mapbox_gl.dart';

class MapboxPage extends StatefulWidget {

  @override
  _MapboxPageState createState() => _MapboxPageState();
}

class _MapboxPageState extends State<MapboxPage> {
  MapboxMapController mapController;

  void _onMapCreated(MapboxMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ....
```
```
body: MapboxMap(
          styleString:
              'mapbox://styles/......',
          onMapCreated: _onMapCreated,
          initialCameraPosition: const CameraPosition(
            target: LatLng(41.967526843532944, 2.837308724693695),
            zoom: 16,
          )),
    );
```
""";

class CodeMapboxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Mapbox'),
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
