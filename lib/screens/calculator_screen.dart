import 'package:flutter/material.dart';
import 'ingredients_screen.dart';
import 'suggestions_screen.dart';
import 'all_cocktails_screen.dart';
import 'location_screen.dart';
import 'edit_user_screen.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final TextEditingController ozController = TextEditingController();
  final TextEditingController mlController = TextEditingController();

  void calculate() {
    if (ozController.text.isNotEmpty) {
      // Convert oz to ml
      final double oz = double.tryParse(ozController.text) ?? 0;
      final double ml = oz * 29.5735; // Conversion factor
      mlController.text = ml.toStringAsFixed(2);
    } else if (mlController.text.isNotEmpty) {
      // Convert ml to oz
      final double ml = double.tryParse(mlController.text) ?? 0;
      final double oz = ml / 29.5735; // Conversion factor
      ozController.text = oz.toStringAsFixed(2);
    }
  }

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
                Navigator.pop(context); // Close drawer if already on this screen
              },
            ),
            ListTile(
              leading: const Icon(Icons.location_on, color: Color(0xFF304E31)),
              title: const Text('Nearest Alcohol Shop'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LocationScreen(),
                  ),
                );
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "OZ to ML calculator",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                      color: Color(0xFF304E31),
                    ),
                  ),
                  Builder(
                    builder: (context) {
                      return IconButton(
                        icon: const Icon(Icons.menu, color: Color(0xFF304E31)),
                        onPressed: () {
                          Scaffold.of(context).openDrawer(); // Open Drawer
                        },
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Input fields
              TextField(
                controller: ozController,
                decoration: InputDecoration(
                  labelText: 'Oz',
                  labelStyle: const TextStyle(color: Color(0xFF304E31)),
                  filled: true,
                  fillColor: const Color(0xFFD9A760),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: mlController,
                decoration: InputDecoration(
                  labelText: 'ML',
                  labelStyle: const TextStyle(color: Color(0xFF304E31)),
                  filled: true,
                  fillColor: const Color(0xFFD9A760),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF304E31),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: calculate,
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
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
