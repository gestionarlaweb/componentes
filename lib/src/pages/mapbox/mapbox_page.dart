import 'package:flutter/material.dart';
import 'package:flutter_ejemplos/src/pages/mapbox/widgets/code_mapbox_page.dart';
import 'package:flutter_ejemplos/src/theme/theme_base.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class MapboxPage extends StatefulWidget {
  @override
  _MapboxPageState createState() => _MapboxPageState();
}

class _MapboxPageState extends State<MapboxPage> {
  // mapController
  MapboxMapController mapController;
  // Coordenadas
  final coordenadas = LatLng(41.967526843532944, 2.837308724693695);
  // Styles
  String selectedStyle =
      'mapbox://styles/gestionarlaweb/ckly05e706u3m17qn9xb8r85g';
  final themeMapaBasic =
      'mapbox://styles/gestionarlaweb/ckly0p5qx5qpc17pnfh3zck6x';
  final themeMapaSatellite =
      'mapbox://styles/gestionarlaweb/ckly05e706u3m17qn9xb8r85g';

  void _onMapCreated(MapboxMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mapbox', style: kTextAppBar),
        actions: [
          IconButton(
            icon: Icon(Icons.code, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Container(
                      child: CodeMapboxPage(),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: crearMapa(),
      floatingActionButton: botonesOpciones(),
    );
  }

  Column botonesOpciones() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // ZoomIn
        FloatingActionButton(
            heroTag: "btn1",
            child: Icon(Icons.zoom_in),
            onPressed: () {
              mapController.animateCamera(CameraUpdate.zoomIn());
            }),
        SizedBox(height: 5.0),

        // ZoomOn
        FloatingActionButton(
            heroTag: "btn2",
            child: Icon(Icons.zoom_out),
            onPressed: () {
              mapController.animateCamera(CameraUpdate.zoomOut());
            }),

        SizedBox(height: 5.0),

        // Cambiar estilo
        FloatingActionButton(
            heroTag: "btn3",
            child: Icon(Icons.add_photo_alternate_outlined),
            onPressed: () {
              if (selectedStyle == themeMapaBasic) {
                selectedStyle = themeMapaSatellite;
              } else {
                selectedStyle = themeMapaBasic;
              }
              setState(() {});
            })
      ],
    );
  }

  MapboxMap crearMapa() {
    return MapboxMap(
        styleString: selectedStyle,
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: coordenadas,
          zoom: 16,
        ));
  }
}
