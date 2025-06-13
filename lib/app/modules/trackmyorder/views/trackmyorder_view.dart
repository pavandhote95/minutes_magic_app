import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrackmyorderView extends StatelessWidget {
  const TrackmyorderView({super.key});

  @override
  Widget build(BuildContext context) {
    final Set<Marker> markers = {
      const Marker(
        markerId: MarkerId('driver'),
        position: LatLng(26.9117, 75.7875), // Near Sindhi Camp
      ),
      const Marker(
        markerId: MarkerId('destination'),
        position: LatLng(26.9124, 75.7873), // MI Road (Very close)
      ),
    };


    final Set<Polyline> polylines = {
      const Polyline(
        polylineId: PolylineId('route'),
        color: Colors.red,
        width: 4,
        visible: true,
        points: [
          LatLng(26.9124, 75.7873), // Near MI Road
          LatLng(26.9157, 75.8054), // Near Bapu Bazaar
          LatLng(26.9162, 75.8243), // Near Albert Hall
          LatLng(26.8545, 75.8235), // Near Gaurav Tower
          LatLng(26.8497, 75.8039), // Ne
        ],
      ),
    };

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Track Order", style: GoogleFonts.poppins()),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: [
          // Map section
          SizedBox(
            height: 300,
            child: Stack(
              children: [
                GoogleMap(
                  initialCameraPosition: const CameraPosition(
                    target: LatLng(26.9124, 75.7873),
                    zoom: 13,
                  ),
                  zoomControlsEnabled: false,
                  myLocationEnabled: false,
                  markers: markers,
                  polylines: polylines,
                ),
                const Positioned(
                  top: 12,
                  right: 12,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.my_location, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),

          // Delivery Person Info
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF3D6),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 24,
                  backgroundImage: NetworkImage('https://via.placeholder.com/150'),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("David Wayne",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                      const SizedBox(height: 4),
                      Text("⭐ 4.9   ID DW2125",
                          style: GoogleFonts.poppins(color: Colors.grey)),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.phone, color: Colors.green),
                  onPressed: () {},
                ),
              ],
            ),
          ),

          // Step Progress & Time
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35), // smaller horizontal padding
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Step 1 (Active)
                CircleAvatar(
                  backgroundColor: Colors.redAccent.withOpacity(0.1),
                  radius: 14, // smaller circle
                  child: Icon(Icons.storefront, color: Colors.redAccent, size: 16),
                ),

                // Line
                Expanded(
                  child: Container(
                    height: 1.5,
                    color: Colors.redAccent,
                  ),
                ),

                // Step 2
                CircleAvatar(
                  backgroundColor: Colors.grey.shade200,
                  radius: 14,
                  child: Icon(Icons.inventory_2, color: Colors.grey, size: 16),
                ),

                // Line
                Expanded(
                  child: Container(
                    height: 1.5,
                    color: Colors.grey.shade300,
                  ),
                ),

                // Step 3
                CircleAvatar(
                  backgroundColor: Colors.grey.shade200,
                  radius: 14,
                  child: Image.asset(
                    'assets/icons/bike.png',
                    height: 14,
                    width: 14,
                    color: Colors.grey,
                  ),
                ),

                // Line
                Expanded(
                  child: Container(
                    height: 1.5,
                    color: Colors.grey.shade300,
                  ),
                ),

                // Step 4
                CircleAvatar(
                  backgroundColor: Colors.grey.shade200,
                  radius: 14,
                  child: Icon(Icons.check_circle, color: Colors.grey, size: 16),
                ),
              ],
            ),
          ),



          // My Order Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("My Order",
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
                TextButton(
                  onPressed: () {},
                  child: Text("Details", style: GoogleFonts.poppins()),
                ),
              ],
            ),
          ),

          Spacer(),
          // Cancel Order Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24 ,vertical: 20),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text("Cancel Order", style: GoogleFonts.poppins()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
