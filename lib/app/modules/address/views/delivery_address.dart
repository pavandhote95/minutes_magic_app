import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:minutes_magic_app/app/modules/address/controllers/address_controller.dart';

class DeliveryAddressView extends GetView<AddressController> {
  const DeliveryAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    final AddressController controller = Get.put(AddressController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          "Your Location",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: Obx(() {
          return SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Search Box
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFF3F3F3),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: [
                        const Icon(Icons.search, size: 22, color: Colors.black54),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            controller: controller.startAddressController,
                            onChanged: controller.onAddressTyped,
                            decoration: const InputDecoration(
                              hintText: "Search a new address",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Current Location Label
                GestureDetector(
                  onTap: (){
                    controller.getCurrentLocation();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      children: [
                        const Icon(Icons.my_location_rounded, color: Colors.green, size: 20),
                        const SizedBox(width: 8),
                        Text(
                          "Current location",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[900],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                // Google Map
                Center(
                  child: SizedBox(
                    height: 250,
                    width: double.infinity,
                    child: controller.initialPosition.value == null
                        ? Container(
                      color: Colors.grey[300],
                      child: const Center(
                        child: CircularProgressIndicator(color: Colors.red),
                      ),
                    )
                        : GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: controller.initialPosition.value!,
                        zoom: 14,
                      ),
                      onMapCreated: (map) => controller.mapController = map,
                      myLocationEnabled: true,
                      zoomControlsEnabled: false,
                      onTap: controller.handleMapTap,
                      markers: controller.selectedMarker.value != null
                          ? {controller.selectedMarker.value!}
                          : {},
                    ),
                  ),
                ),

                // Tapped Address
                if (controller.startAddressController.text.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF9F9F9),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.location_on, color: Colors.green, size: 24),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Tapped Location",
                                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  controller.startAddressController.text,
                                  style: const TextStyle(fontSize: 13),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: () {
                              final tapped = controller.startAddressController.text.trim();
                              if (tapped.isNotEmpty &&
                                  !controller.previousAddresses.contains(tapped)) {
                                controller.previousAddresses.add(tapped);
                                controller.selectedSavedAddress.value = tapped;
                                controller.startAddressController.clear();
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              minimumSize: const Size(50, 36),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                            ),
                            child: const Text(
                              "Add",
                              style: TextStyle(fontSize: 13, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                // Saved Locations Header
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Saved Locations',
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                      TextButton.icon(
                        onPressed: controller.addNewAddressDialog,
                        icon: const Icon(Icons.add_location_alt_rounded, color: Colors.green),
                        label: const Text("Add", style: TextStyle(color: Colors.green)),
                      ),
                    ],
                  ),
                ),

                // Saved Address List
                ...controller.previousAddresses
                    .where((address) => address != controller.selectedSavedAddress.value)
                    .map(
                      (address) => Obx(
                        () => GestureDetector(
                      onTap: () => controller.selectAddress(address),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: controller.selectedSavedAddress.value == address
                                ? Colors.green
                                : Colors.grey.shade300,
                            width: 1.5,
                          ),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.05),
                              blurRadius: 5,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Radio<String>(
                              value: address,
                              groupValue: controller.selectedSavedAddress.value,
                              onChanged: (val) => controller.selectAddress(val!),
                              activeColor: Colors.green,
                            ),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("Other",
                                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14)),
                                  const SizedBox(height: 4),
                                  Text(address,
                                      style: const TextStyle(fontSize: 13),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2),
                                ],
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.edit, color: Colors.blue, size: 20),
                              onPressed: () => controller.editAddressDialog(address),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red, size: 20),
                              onPressed: () => controller.deleteAddress(address),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          );
        }),
      ),
    );
  }
}