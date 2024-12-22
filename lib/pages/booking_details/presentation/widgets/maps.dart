import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSection extends StatefulWidget {
  const MapSection({super.key});

  @override
  State<MapSection> createState() => _MapSectionState();
}

class _MapSectionState extends State<MapSection> {
  final Completer<GoogleMapController> _controllar = Completer();
  static final CameraPosition _kGooglePlex =
      CameraPosition(target: LatLng(30.201920, 71.453056), zoom: 14.4746);

  final List<Marker> _marker = [];
  final List<Marker> _list = [
    const Marker(
      markerId: MarkerId('1'),
      position: LatLng(30.201920, 71.453056),
      infoWindow: InfoWindow(title: 'my current Loction'),
    ),
    const Marker(
      markerId: MarkerId('2'),
      position: LatLng(30.2116, 71.4697),
      infoWindow: InfoWindow(title: 'City Hospital'),
    ),
    const Marker(
      markerId: MarkerId('3'),
      position: LatLng(30.2102, 71.4885),
      infoWindow: InfoWindow(title: 'Fatima Medical Center'),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _marker.addAll(_list);
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
          mapType: MapType.normal,
          zoomControlsEnabled: false,
          markers: Set<Marker>.of(_marker),
          myLocationEnabled: true,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controllar) {
    _controllar.complete(controllar);
          },
        );
  }
}
