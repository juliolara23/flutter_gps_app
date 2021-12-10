import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gps_camera_app/pages/camera_page.dart';
import 'package:gps_camera_app/pages/location_page.dart';
import 'package:gps_camera_app/pages/route_page.dart';
import 'package:gps_camera_app/services/geolocator_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GeolocatorService geolocatorService = Get.find();

  // Atributo
  int _selectIndex = 0;
  // Controlador de autenticacion
  //FireAuth authenticationController = Get.find();
  // Listado de Widgets a mostrar
  static final List<Widget> _widgets = <Widget>[
    const LocationPage(),
    const RoutePage(),
    const CameraPage()
  ];

  // Metodo para realizar cambio de Widget
  _onItemTapped(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    geolocatorService.checkPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              //_logout();
            },
          ),
        ],
      ),
      body: _widgets.elementAt(_selectIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.gps_fixed), label: "Localizacion"),
          BottomNavigationBarItem(icon: Icon(Icons.alt_route), label: "Ruta"),
          BottomNavigationBarItem(icon: Icon(Icons.camera), label: "Camara"),
        ],
        currentIndex: _selectIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
