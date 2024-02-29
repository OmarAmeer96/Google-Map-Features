import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap({super.key});

  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  late CameraPosition initialCameraPosition;

  @override
  void initState() {
    initialCameraPosition = const CameraPosition(
      target: LatLng(30.79900787528476, 31.00206213176501),
      zoom: 13,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: initialCameraPosition,
      cameraTargetBounds: CameraTargetBounds(
        LatLngBounds(
          northeast: const LatLng(30.828787393718397, 31.01620939037795),
          southwest: const LatLng(30.76265444706483, 30.971685935161435),
        ),
      ),
    );
  }
}
