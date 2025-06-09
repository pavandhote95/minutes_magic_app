import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minutes_magic_app/app/modules/profile/controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Profile"),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: InkWell(
            onTap: () {
              Get.toNamed("\home");
            },
            child: Container(
              height: 28,
              width: 28,

              decoration: BoxDecoration(

                color: const Color.fromARGB(224, 244, 243, 243),
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Center(
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black54,
                  size: 18,
                ),
              ),
            ),
          ),
        ),
        actions: [
          IconButton(icon: const Icon(Icons.edit, size: 20), onPressed: () {}),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        children: [
          // Profile Header
          Row(
            children: [
              const CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage("assets/images/profile.png"),
              ),
              const SizedBox(width: 20),

              Column(
                children: [
                  const Text(
                    "Riya Sharma",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const Text(
                    "@riyasharma",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Option List
          _buildOptionTile(Icons.person_outline, "Edit Profile", () {}),
          _buildOptionTile(Icons.settings_outlined, "Setting", () {}),
          _buildSwitchTile(),
          _buildOptionTile(
            Icons.receipt_long_outlined,
            "Transaction History",
            () {},
          ),

          _buildOptionTile(Icons.info_outline, "About app", () {}),
          _buildOptionTile(Icons.help_outline, "FAQ", () {}),
          _buildOptionTile(Icons.logout, "Log out", () {}),
        ],
      ),
    );
  }

  Widget _buildOptionTile(IconData icon, String label, VoidCallback onTap) {
    return Card(
      elevation: 0,
      color: const Color.fromARGB(255, 249, 248, 248),
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(leading: Icon(icon), title: Text(label), onTap: onTap),
    );
  }

  Widget _buildSwitchTile() {
    return Card(
      color: const Color.fromARGB(255, 245, 244, 244),
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 12),
      child: SwitchListTile(
        value: true,
        onChanged: (val) {},
        secondary: const Icon(Icons.notifications_none),
        title: const Text("Notification"),
      ),
    );
  }
}
