import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../util/app_bar.dart';
import '../model/office.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController mapController;

  final Map<String, Marker> _markers = {};
  final List<Office> appWorksSchoolOffice = [
    Office("AppWorks School", 25.038946886956325, 121.53239255767078, "AppWorks School"),
    Office("AppWorks School 市府舊基地", 25.043765740367277, 121.56463102131549, "AppWorks School 市府舊基地")
  ];
  final LatLng _center = const LatLng(25.042756233286333, 121.54369880190039);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    setState(() {
      _markers.clear();
      for (final office in appWorksSchoolOffice) {
        final marker = Marker(
          markerId: MarkerId(office.name),
          position: LatLng(office.lat, office.lng),
          infoWindow: InfoWindow(
            title: office.name,
            snippet: office.address,
          ),
        );
        _markers[office.name] = marker;
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createStylishAppBar(context),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 13.0,
        ),
        markers: _markers.values.toSet(),
      ),
    );
  }
}
