import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:minutes_magic_app/app/modules/address/controllers/address_controller.dart';

class AddressView extends GetView<AddressController> {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    final AddressController controller = Get.put(AddressController());
    final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

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
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      children: [
                        const SizedBox(height: 16),

                        /// Location Inputs
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            children: [
                              Obx(
                                () => _locationField(
                                  Icons.radio_button_checked,
                                  controller.initialPosition.value == null
                                      ? 'Fetching your current address...'
                                      : controller.startAddress.value,
                                  controller: controller.startAddressController,
                                  readOnly: false,
                                  onChanged: controller.onAddressTyped,
                                ),
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
                          child: Obx(() {
                            if (controller.initialPosition.value == null) {
                              return Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                color: Colors.grey[200],
                                child: const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.redAccent,
                                  ),
                                ),
                              );
                            }

                            return GoogleMap(
                              initialCameraPosition: CameraPosition(
                                target: controller.initialPosition.value!,
                                zoom: 14,
                              ),
                              onMapCreated:
                                  (map) => controller.mapController = map,
                              myLocationEnabled: true,
                              zoomControlsEnabled: false,
                              onTap: controller.handleMapTap,
                              markers:
                                  controller.selectedMarker.value != null
                                      ? {controller.selectedMarker.value!}
                                      : {},
                            );
                          }),
                        ),

                        const SizedBox(height: 16),
                        !isKeyboardOpen
                            ? _deliveryOptions()
                            : SizedBox.shrink(),
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
    void Function(String)? onChanged,
  }) {
    return Row(
      children: [
        Icon(icon, size: 18),
        const SizedBox(width: 8),
        Expanded(
          child: TextField(
            readOnly: readOnly,
            controller: controller,
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: hint,
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
        if (isFilled)
          GestureDetector(
            onTap: () {
              if (controller != null) {
                controller.clear();
              }
            },
            child: const Icon(Icons.cancel, size: 18),
          ),
      ],
    );
  }

  Widget _deliveryOptions() {
    final options = [
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

    return Column(
      children:
          options.map((item) {
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
                      item['image'].toString(),
                      width: 35,
                      height: 35,
                    ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            item['weight'].toString(),
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
    );
  }
}
