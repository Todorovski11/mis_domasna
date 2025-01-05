import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'ingredients_screen.dart';
import 'suggestions_screen.dart';
import 'all_cocktails_screen.dart';
import 'calculator_screen.dart';
import 'edit_user_screen.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xFF9AB283),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/profile_picture.jpg'),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Martin Todorovski',
                    style: TextStyle(
                      color: Color(0xFF304E31),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const Text(
                    'Amateur cocktail maker',
                    style: TextStyle(
                      color: Color(0xFF304E31),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: Color(0xFF304E31)),
              title: const Text('Add Ingredients'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const IngredientsScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.local_drink, color: Color(0xFF304E31)),
              title: const Text('Suggested Cocktails'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SuggestionsScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.menu_book, color: Color(0xFF304E31)),
              title: const Text('All Cocktails'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AllCocktailsScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.calculate, color: Color(0xFF304E31)),
              title: const Text('Oz to Ml Calculator'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CalculatorScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.location_on, color: Color(0xFF304E31)),
              title: const Text('Nearest Alcohol Shop'),
              onTap: () {
                Navigator.pop(context); // Close drawer if already on this screen
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit, color: Color(0xFF304E31)),
              title: const Text('Edit Your Profile'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EditUserScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: FlutterMap(
              options: MapOptions(
                center: LatLng(42.005862431211014, 21.392183109638644),
                zoom: 13.0,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: ['a', 'b', 'c'],
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: LatLng(42.005862431211014, 21.392183109638644),
                      builder: (context) => const Icon(
                        Icons.location_pin,
                        color: Colors.red,
                        size: 40,
                      ),
                    ),
                    Marker(
                      point: LatLng(42.0049, 21.3945),
                      builder: (context) => const Icon(
                        Icons.location_pin,
                        color: Colors.blue,
                        size: 40,
                      ),
                    ),
                    Marker(
                      point: LatLng(42.0038, 21.3961),
                      builder: (context) => const Icon(
                        Icons.location_pin,
                        color: Colors.green,
                        size: 40,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF304E31),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  // Action for the calculate button
                },
                child: const Text(
                  'Calculate',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: const Color(0xFF9AB283),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          "Nearest Alcohol Shop",
          style: TextStyle(
            color: Color(0xFF304E31),
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: Color(0xFF304E31)),
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Open Drawer
              },
            );
          },
        ),
      ),
    );
  }
}
