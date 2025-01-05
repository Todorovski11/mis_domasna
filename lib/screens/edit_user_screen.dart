import 'package:flutter/material.dart';

class EditUserScreen extends StatelessWidget {
  const EditUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF304E31),
        elevation: 0,
        title: const Text(
          'List of Available Screens',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFF9AB283),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              CircleAvatar(
                radius: 50,
                backgroundImage: const AssetImage('assets/profile_picture.jpg'),
              ),
              const SizedBox(height: 10),
              const Text(
                'Edit Profile',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF304E31),
                ),
              ),
              const Text(
                'Take picture',
                style: TextStyle(fontSize: 14, color: Color(0xFF304E31)),
              ),
              const SizedBox(height: 20),
              _buildTextField('Username', 'YANCHUI'),
              const SizedBox(height: 10),
              _buildTextField('Email', 'yanchui@gmail.com'),
              const SizedBox(height: 10),
              _buildTextField('Dark mode', 'OFF'),
              const SizedBox(height: 10),
              _buildTextField('Change password', 'evFTbyVVcD'),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle update functionality
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF304E31),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text(
                  'Update',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String hintText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: Color(0xFF304E31)),
        ),
        const SizedBox(height: 5),
        TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFFF5F5F5),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            hintText: hintText,
            hintStyle: const TextStyle(fontSize: 14, color: Colors.black54),
          ),
        ),
      ],
    );
  }
}
