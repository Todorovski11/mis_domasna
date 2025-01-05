import 'package:flutter/material.dart';
import 'recepi_details_screen.dart';
import 'ingredients_screen.dart';
import 'all_cocktails_screen.dart';
import 'calculator_screen.dart';
import 'location_screen.dart';
import 'edit_user_screen.dart';

class SuggestionsScreen extends StatelessWidget {
  const SuggestionsScreen({super.key});

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
                Navigator.pop(context); // Close drawer if already on this screen
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
                    "Suggested Cocktails",
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
              const SizedBox(height: 5),
              Opacity(
                opacity: 0.6, // Apply opacity to the text
                child: const Text(
                  "Cocktails you can make with your ingredients",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // List of Cocktails
              Expanded(
                child: ListView(
                  children: [
                    _cocktailCard(
                      "Moscow mule",
                      "Vodka, ginger beer, lime",
                      "assets/moscow_mule.jpg",
                      context,
                    ),
                    _cocktailCard(
                      "Mojito",
                      "White rum, soda water, mint, lime",
                      "assets/mojito.jpg",
                      context,
                    ),
                    _cocktailCard(
                      "Amaretto sour",
                      "Amaretto, lemon juice, sugar syrup",
                      "assets/amaretto_sour.jpg",
                      context,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _cocktailCard(
      String title, String description, String imagePath, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecipeDetailsScreen(
              title: title,
              imagePath: imagePath,
              description:
                  "A refreshing blend of $title. Perfect for any occasion!",
              ingredients: [
                {'name': 'Vodka', 'quantity': '2 oz'},
                {'name': 'Ginger beer', 'quantity': '4 oz'},
                {'name': 'Fresh lime juice', 'quantity': '1/2 oz'},
                {'name': 'Ice', 'quantity': 'full glass'},
              ],
              recipe:
                  "Fill a copper mug or glass with ice, add 2 oz vodka and 1/2 oz fresh lime juice, top with 4 oz ginger beer, gently stir, and garnish with a lime wedge and optional mint sprig. Serve and enjoy!",
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Container(
          height: 240,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF503B32).withOpacity(0.06),
                blurRadius: 46,
                offset: const Offset(6, 18),
              ),
            ],
          ),
          child: Stack(
            children: [
              // Cocktail Image
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Description
              Positioned(
                bottom: 16,
                left: 12,
                right: 12,
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color(0xFF304E31),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          description,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Color(0xFF304E31),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
