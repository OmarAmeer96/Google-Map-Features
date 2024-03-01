import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
  void dispose() {
    googleMapController.dispose();
    super.dispose();
  }

  late GoogleMapController googleMapController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          onMapCreated: (controller) {
            googleMapController = controller;
          },
          initialCameraPosition: initialCameraPosition,
          // cameraTargetBounds: CameraTargetBounds(
          //   LatLngBounds(
          //     northeast: const LatLng(30.828787393718397, 31.01620939037795),
          //     southwest: const LatLng(30.76265444706483, 30.971685935161435),
          //   ),
          // ),

          // "Normal" is the defaulf MapType
          mapType: MapType.normal,
        ),
        Positioned(
          bottom: 16,
          left: 16,
          right: 16,
          child: ElevatedButton(
            onPressed: () {
              // The class is named "CameraUpdate" as it update the whole camera attributes like position, zoom, ... . not just the Latlng().
              CameraPosition newLocation = const CameraPosition(
                target: LatLng(24.714896340717083, 46.68578759605556),
                zoom: 13,
              );
              googleMapController.animateCamera(
                CameraUpdate.newCameraPosition(newLocation),
              );
            },
            child: const Text("Change Location"),
          ),
        ),
      ],
    );
  }
}
