import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class AddressController extends GetxController {
  //Timport 'package:flutter/material.dart';

  Rx<LatLng?> initialPosition = Rx<LatLng?>(null);
  Rx<Marker?> selectedMarker = Rx<Marker?>(null);
  RxString startAddress = ''.obs;
  TextEditingController startAddressController = TextEditingController();
  GoogleMapController? mapController;

  @override
  void onInit() {
    super.onInit();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) return;
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    initialPosition.value = LatLng(position.latitude, position.longitude);
    startAddress.value = "Your current location";
    startAddressController.text = startAddress.value;
  }

  Future<void> handleMapTap(LatLng position) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    if (placemarks.isNotEmpty) {
      Placemark place = placemarks[0];
      String address =
          "${place.street}, ${place.subLocality}, ${place.locality}, ${place.administrativeArea} - ${place.postalCode}, ${place.country}";

      startAddress.value = address;
      startAddressController.text = address;

      selectedMarker.value = Marker(
        markerId: const MarkerId("tappedLocation"),
        position: position,
        infoWindow: InfoWindow(title: "Selected Location", snippet: address),
      );

      Get.back(result: address);
    }
  }

  Future<void> onAddressTyped(String input) async {
    if (input.isEmpty) return;

    try {
      List<Location> locations = await locationFromAddress(input);
      if (locations.isNotEmpty) {
        final loc = locations.first;
        final newLatLng = LatLng(loc.latitude, loc.longitude);

        selectedMarker.value = Marker(
          markerId: const MarkerId("typedLocation"),
          position: newLatLng,
          infoWindow: const InfoWindow(title: "Typed Address"),
        );

        initialPosition.value = newLatLng;
        startAddress.value = input;

        mapController?.animateCamera(CameraUpdate.newLatLngZoom(newLatLng, 14));
      }
    } catch (e) {
      print("Geocoding failed: $e");
    }
  }
}
