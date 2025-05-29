import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationVeiw extends StatefulWidget {
  const LocationVeiw({super.key});

  @override
  State<LocationVeiw> createState() => _LocationVeiwState();
}

class _LocationVeiwState extends State<LocationVeiw> {
  GoogleMapController? _mapController;
  LatLng? _initialPosition;
  Marker? _selectedMarker;
  String _startAddress = '';
  final TextEditingController _startAddressController = TextEditingController();

  @override
  void initState() {
    super.initState();
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

    setState(() {
      _initialPosition = LatLng(position.latitude, position.longitude);
      _startAddress = "Your current location";
      _startAddressController.text = _startAddress;
    });
  }

  void _handleMapTap(LatLng position) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    if (placemarks.isNotEmpty) {
      Placemark place = placemarks[0];
      String address =
          "${place.street}, ${place.subLocality}, ${place.locality}, ${place.administrativeArea} - ${place.postalCode}, ${place.country}";

      setState(() {
        _startAddress = address;
        _startAddressController.text = address;
        _selectedMarker = Marker(
          markerId: const MarkerId("tappedLocation"),
          position: position,
          infoWindow: InfoWindow(title: "Selected Location", snippet: address),
        );
      });

      Get.back(result: address);
    }
  }

  Future<void> _onAddressTyped(String input) async {
    if (input.isEmpty) return;

    try {
      List<Location> locations = await locationFromAddress(input);
      if (locations.isNotEmpty) {
        final loc = locations.first;
        final newLatLng = LatLng(loc.latitude, loc.longitude);

        setState(() {
          _selectedMarker = Marker(
            markerId: const MarkerId("typedLocation"),
            position: newLatLng,
            infoWindow: const InfoWindow(title: "Typed Address"),
          );
          _initialPosition = newLatLng;
          _startAddress = input;
        });

        _mapController?.animateCamera(
          CameraUpdate.newLatLngZoom(newLatLng, 14),
        );
      }
    } catch (e) {
      print("Geocoding failed: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      children: [
                        const SizedBox(height: 16),

                        /// Location Inputs
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            children: [
                              _locationField(
                                Icons.radio_button_checked,
                                _startAddress,
                                controller: _startAddressController,
                                readOnly: false,
                              ),
                              const SizedBox(height: 8),
                              _locationField(
                                Icons.location_on_outlined,
                                "Dropoff location",
                                isFilled: false,
                                readOnly: true,
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 10),

                        /// Google Map
                        Expanded(
                          child: _initialPosition == null
                              ? Container(
                            height: MediaQuery.of(context).size.height * 0.4,
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            color: Colors.grey[200],
                            child: const Center(
                              child: CircularProgressIndicator(color: Colors.redAccent),
                            ),
                          )
                              : GoogleMap(
                            initialCameraPosition: CameraPosition(
                              target: _initialPosition!,
                              zoom: 14,
                            ),
                            onMapCreated: (controller) => _mapController = controller,
                            myLocationEnabled: true,
                            zoomControlsEnabled: false,
                            onTap: _handleMapTap,
                            markers: _selectedMarker != null ? {_selectedMarker!} : {},
                          ),
                        ),

                        const SizedBox(height: 16),
                        _deliveryOptions(),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _locationField(
      IconData icon,
      String hint, {
        bool isFilled = true,
        TextEditingController? controller,
        bool readOnly = true,
      }) {
    return Row(
      children: [
        Icon(icon, size: 18),
        const SizedBox(width: 8),
        Expanded(
          child: TextField(
            readOnly: readOnly,
            controller: controller ?? TextEditingController(text: hint),
            onChanged: (value) {
              if (!readOnly) {
                _onAddressTyped(value);
              }
            },
            decoration: InputDecoration(
              filled: isFilled,
              fillColor: Colors.grey[100],
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 10,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        const SizedBox(width: 4),
        if (isFilled) const Icon(Icons.cancel, size: 18),
      ],
    );
  }

  Widget _deliveryOptions() {
    List<Map<String, dynamic>> options = [
      {
        'image': 'assets/images/scooter.png',
        'weight': '5 kg',
        'time': '5 min',
        'price': 35,
        'oldPrice': 50,
      },
      {
        'image': 'assets/images/dumper.png',
        'weight': '5 kg',
        'time': '5 min',
        'price': 35,
        'oldPrice': 50,
      },
      {
        'image': 'assets/images/truck.png',
        'weight': '5 kg',
        'time': '5 min',
        'price': 35,
        'oldPrice': 50,
      },
      {
        'image': 'assets/images/dumper2.png',
        'weight': '5 kg',
        'time': '5 min',
        'price': 35,
        'oldPrice': 50,
      },
    ];

    return GestureDetector(
      onTap: () {
        // Future navigation logic
      },
      child: Column(
        children: options.map((item) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    item['image'],
                    width: 35,
                    height: 35,
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          item['weight'],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "delivered in ${item['time']}",
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "₹${item['price']}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "₹${item['oldPrice']}",
                        style: const TextStyle(
                          decoration: TextDecoration.lineThrough,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
