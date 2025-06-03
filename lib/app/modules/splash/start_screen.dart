import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class StartView extends StatefulWidget {
  const StartView({super.key});

  @override
  State<StartView> createState() => _StylishViewState();
}

class _StylishViewState extends State<StartView>
    with SingleTickerProviderStateMixin {
  RxString startAddress = ''.obs;
  TextEditingController startAddressController = TextEditingController();
  GoogleMapController? mapController;

  Rx<LatLng?> initialPosition = Rx<LatLng?>(null);
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    // Animation controller can be initialized here if needed
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
      if (permission == LocationPermission.denied) {
        Get.snackbar(
          "Permission Denied",
          "Location permission is required for this feature.",
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // 💡 Show dialog to open app settings
      Get.defaultDialog(
        title: "Location Required",
        middleText:
            "You have permanently denied location access. Please enable it from app settings.",
        confirm: ElevatedButton(
          onPressed: () {
            Geolocator.openAppSettings();
            Get.back();
          },
          child: Text("Open Settings"),
        ),
        cancel: TextButton(
          onPressed: () {
            Get.back();
          },
          child: Text("Cancel"),
        ),
      );
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    initialPosition.value = LatLng(position.latitude, position.longitude);
    startAddress.value = "Your current location";
    startAddressController.text = startAddress.value;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 100),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: RichText(
                text: TextSpan(
                  style: GoogleFonts.k2d(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  children: [
                    const TextSpan(
                      text:
                          "Secure, Reliable\nDelivery at Your\nFingertips With\n",
                    ),
                    TextSpan(
                      text: "Minutes Magic",
                      style: GoogleFonts.k2d(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: size.height * 0.02),
            FadeInLeft(
              duration: Duration(milliseconds: 1000),
              child: Center(
                child: Image.asset(
                  'assets/images/start.png',
                  height: size.height * 0.35,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 250,
              width: double.infinity,
              padding: const EdgeInsets.all(30),
              decoration: const BoxDecoration(
                color: Color(0xFFFFD400),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      _getCurrentLocation();
                    },
                    child: Text(
                      'Enable Location Access',

                      style: GoogleFonts.k2d(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'We need your location to provide the best\nexperience tailored to your area.',
                    style: GoogleFonts.k2d(fontSize: 15),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Get.toNamed('/login');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 12,
                      ),
                    ),
                    child: Text(
                      'Allow Location',
                      style: GoogleFonts.heebo(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
