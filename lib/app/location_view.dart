import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationVeiw extends StatefulWidget {
  const LocationVeiw({super.key});

  @override
  State<LocationVeiw> createState() => _LocationVeiwState();
}

class _LocationVeiwState extends State<LocationVeiw> {
  GoogleMapController? _mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          const SizedBox(height: 50),

          /// Top Section with Location Input
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                _locationField(
                  Icons.radio_button_checked,
                  "Evergreen Mills Rd, Aldie, VA",
                ),
                const SizedBox(height: 8),
                _locationField(
                  Icons.location_on_outlined,
                  "Dropoff location",
                  isFilled: false,
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          /// Google Map
          Expanded(
            child: Stack(
              children: [
                GoogleMap(
                  initialCameraPosition: const CameraPosition(
                    target: LatLng(37.7749, -122.4194),
                    zoom: 13,
                  ),
                  onMapCreated: (controller) => _mapController = controller,
                  myLocationEnabled: true,
                  zoomControlsEnabled: false,
                ),
                Positioned(
                  top: 100,
                  left: 130,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 4),
                      ],
                    ),
                    child: const Text(
                      "Arrival\n9 min",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// Delivery Vehicles
          _deliveryOptions(),

          /// Receiver Form Section
          _receiverForm(),

          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _locationField(IconData icon, String hint, {bool isFilled = true}) {
    return Row(
      children: [
        Icon(icon, size: 18),
        const SizedBox(width: 8),
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: hint,
              filled: isFilled,
              fillColor: isFilled ? Colors.white : null,
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
        'icon': Icons.delivery_dining,
        'weight': '5 kg',
        'time': '5 min',
        'price': 35,
        'oldPrice': 50,
      },
      {
        'icon': Icons.electric_moped,
        'weight': '5 kg',
        'time': '5 min',
        'price': 35,
        'oldPrice': 50,
      },
      {
        'icon': Icons.fire_truck,
        'weight': '5 kg',
        'time': '5 min',
        'price': 35,
        'oldPrice': 50,
      },
      {
        'icon': Icons.airport_shuttle,
        'weight': '5 kg',
        'time': '5 min',
        'price': 35,
        'oldPrice': 50,
      },
    ];

    return Column(
      children:
          options.map((item) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
                ),
                child: Row(
                  children: [
                    Icon(item['icon'], size: 28),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                    const Spacer(),
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
    );
  }

  Widget _receiverForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Receiver details",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 12),
          _textInput("Name"),
          const SizedBox(height: 8),
          _textInput("House / Apartment / Shop"),
          const SizedBox(height: 8),
          _textInput("Receiver's Mobile number"),
        ],
      ),
    );
  }

  Widget _textInput(String hint) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 10,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
