import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

// ------------------ AddressController ------------------

class AddressController extends GetxController {
  final RxString selectedSavedAddress = ''.obs;

  Rx<LatLng?> initialPosition = Rx<LatLng?>(null);
  Rx<Marker?> selectedMarker = Rx<Marker?>(null);
  RxString selectedAddress = ''.obs;
  RxString startAddress = ''.obs;
  RxList<String> previousAddresses = <String>[].obs;

  TextEditingController startAddressController = TextEditingController();
  GoogleMapController? mapController;

  @override
  void onInit() {
    super.onInit();
    getCurrentLocation();
  }


  Future<void> getCurrentLocation() async {
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

    final currentLatLng = LatLng(position.latitude, position.longitude);
    initialPosition.value = currentLatLng;

    List<Placemark> placemarks = await placemarkFromCoordinates(
      currentLatLng.latitude,
      currentLatLng.longitude,
    );

    if (placemarks.isNotEmpty) {
      final place = placemarks.first;
      String address =
          "${place.street}, ${place.locality}, ${place.administrativeArea} - ${place.postalCode}";

      selectedAddress.value = address;
      startAddress.value = address;
      startAddressController.text = address;
      addToPrevious(address);

      selectedMarker.value = Marker(
        markerId: const MarkerId("current"),
        position: currentLatLng,
        infoWindow: const InfoWindow(title: "Current Location"),
      );
    }
  }

  Future<void> handleMapTap(LatLng position) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    if (placemarks.isNotEmpty) {
      Placemark place = placemarks.first;
      String address =
          "${place.street}, ${place.locality}, ${place.administrativeArea} - ${place.postalCode}";

      selectedAddress.value = address;
      startAddressController.text = address;

      selectedMarker.value = Marker(
        markerId: const MarkerId("tapped"),
        position: position,
        infoWindow: InfoWindow(title: "Selected Location", snippet: address),
      );
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
          infoWindow: const InfoWindow(title: "Typed Location"),
        );

        selectedAddress.value = input;
        startAddressController.text = input;
        addToPrevious(input);

        initialPosition.value = newLatLng;
        mapController?.animateCamera(CameraUpdate.newLatLngZoom(newLatLng, 14));
      }
    } catch (e) {
      print("Geocoding failed: $e");
    }
  }

  void addToPrevious(String address) {
    if (!previousAddresses.contains(address)) {
      previousAddresses.insert(0, address);
      if (previousAddresses.length > 5) {
        previousAddresses.removeLast();
      }
    }
  }

  void selectAddress(String address) {
    selectedSavedAddress.value = address;
    startAddressController.text = address;
    onAddressTyped(address);
  }

  void addNewAddressDialog() {
    final newAddressController = TextEditingController();

    Get.dialog(
      AlertDialog(
        title: const Text("Add New Address"),
        content: TextField(
          controller: newAddressController,
          decoration: const InputDecoration(
            hintText: "Enter address",
            border: OutlineInputBorder(),
          ),
          maxLines: 2,
        ),
        actionsPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            style: TextButton.styleFrom(
              backgroundColor: Colors.grey.shade600,
              foregroundColor: Colors.white, // text color
              shape: const RoundedRectangleBorder(),
              minimumSize: const Size(80, 36),
            ),
            child: const Text("Cancel", style: TextStyle(color: Colors.white)),
          ),
          ElevatedButton(
            onPressed: () {
              final newAddress = newAddressController.text.trim();
              if (newAddress.isNotEmpty) {
                previousAddresses.insert(0, newAddress);
                selectAddress(newAddress);
                Get.back();
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue.shade700,
              shape: const RoundedRectangleBorder(),
              minimumSize: const Size(80, 36),
            ),
            child: const Text("Add", style: TextStyle(color: Colors.white)),
          ),
        ],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }

  void editAddressDialog(String oldAddress) {
    final editController = TextEditingController(text: oldAddress);

    Get.dialog(
      AlertDialog(
        title: const Text("Edit Address"),
        content: TextField(
          controller: editController,
          decoration: const InputDecoration(
            hintText: "Update address",
            border: OutlineInputBorder(),
          ),
          maxLines: 2,
        ),
        actionsPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            style: TextButton.styleFrom(
              backgroundColor: Colors.grey.shade600,
              foregroundColor: Colors.white,
              shape: const RoundedRectangleBorder(),
              minimumSize: const Size(80, 36),
            ),
            child: const Text("Cancel", style: TextStyle(color: Colors.white)),
          ),
          ElevatedButton(
            onPressed: () {
              final newAddress = editController.text.trim();
              if (newAddress.isNotEmpty) {
                final index = previousAddresses.indexOf(oldAddress);
                if (index != -1) {
                  previousAddresses[index] = newAddress;
                  if (selectedSavedAddress.value == oldAddress) {
                    selectAddress(newAddress);
                  }
                }
                Get.back();
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue.shade700,
              shape: const RoundedRectangleBorder(),
              minimumSize: const Size(80, 36),
            ),
            child: const Text("Update", style: TextStyle(color: Colors.white)),
          ),
        ],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }

  void deleteAddress(String address) {
    Get.dialog(
      AlertDialog(
        title: const Text("Delete Address"),
        content: const Text("Are you sure you want to delete this address?"),
        actionsPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            style: TextButton.styleFrom(
              backgroundColor: Colors.grey.shade600,
              foregroundColor: Colors.white,
              shape: const RoundedRectangleBorder(),
              minimumSize: const Size(80, 36),
            ),
            child: const Text("Cancel", style: TextStyle(color: Colors.white)),
          ),
          ElevatedButton(
            onPressed: () {
              previousAddresses.remove(address);
              if (selectedSavedAddress.value == address) {
                selectedSavedAddress.value = '';
              }
              Get.back();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              shape: const RoundedRectangleBorder(),
              minimumSize: const Size(80, 36),
            ),
            child: const Text("Delete", style: TextStyle(color: Colors.white)),
          ),
        ],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }

}

// ------------------ Address Bottom Sheet Widget ------------------

class AddressBottomSheet extends StatelessWidget {
  final AddressController controller = Get.find<AddressController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.65,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Drag Handle
          Center(
            child: Container(
              width: 40,
              height: 5,
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ),

          const Text(
            'Choose Delivery Address',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          Expanded(
            child: Obx(() {
              final addresses = controller.previousAddresses;
              if (addresses.isEmpty) {
                return const Center(
                  child: Text(
                    'No saved addresses found.',
                    style: TextStyle(color: Colors.grey),
                  ),
                );
              }

              return ListView.separated(
                itemCount: addresses.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final address = addresses[index];
                  final isSelected = controller.selectedSavedAddress.value == address;

                  return GestureDetector(
                    onTap: () {
                      controller.selectAddress(address);
                      Get.back(); // close sheet on select
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.blue.shade50 : Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: isSelected ? Colors.blue : Colors.grey.shade300,
                          width: isSelected ? 1.6 : 1.0,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.03),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Icon(
                            isSelected
                                ? Icons.radio_button_checked
                                : Icons.radio_button_unchecked,
                            color: isSelected ? Colors.blue : Colors.grey,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  address,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: isSelected ? Colors.blue.shade800 : Colors.black87,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Home • Tap to select',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: isSelected
                                        ? Colors.blue.shade600
                                        : Colors.grey.shade600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit_outlined,
                                    size: 20, color: Colors.grey),
                                onPressed: () => controller.editAddressDialog(address),
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete_outline,
                                    size: 20, color: Colors.redAccent),
                                onPressed: () => controller.deleteAddress(address),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
          ),

          const SizedBox(height: 16),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              icon: const Icon(Icons.add_location_alt_outlined),
              label: const Text('Add New Address'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade700,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                elevation: 2,
              ),
              onPressed: controller.addNewAddressDialog,
            ),
          ),
        ],
      ),
    );
  }
}

// ------------------ Example Main UI ------------------

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AddressController controller = Get.put(AddressController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flipkart Style Address Bottom Sheet',
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  final AddressController controller = Get.find<AddressController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Address Selector"),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(() {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Selected Address:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                controller.selectedSavedAddress.value.isEmpty
                    ? "No address selected"
                    : controller.selectedSavedAddress.value,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Get.bottomSheet(
                    AddressBottomSheet(),
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                  );
                },
                child: const Text("Select Delivery Address"),
              ),
            ],
          );
        }),
      ),
    );
  }
}
