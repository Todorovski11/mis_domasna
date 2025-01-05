import 'package:flutter/material.dart';

class RecipeDetailsScreen extends StatelessWidget {
  final String title;
  final String imagePath;
  final String description;
  final List<Map<String, String>> ingredients;
  final String recipe;

  const RecipeDetailsScreen({
    super.key,
    required this.title,
    required this.imagePath,
    required this.description,
    required this.ingredients,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFF9AB283),
          borderRadius: BorderRadius.circular(50),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 60),
                // Header with Back Button
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Color(0xFF304E31),
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const Spacer(),
                  ],
                ),
                const SizedBox(height: 10),
                // Title
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'Merriweather',
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF304E31),
                  ),
                ),
                const SizedBox(height: 20),
                // Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    imagePath,
                    height: 240,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 20),
                // About this cocktail
                const Text(
                  "About this cocktail",
                  style: TextStyle(
                    fontFamily: 'Merriweather',
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                    color: Color(0xFF304E31),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  description,
                  style: const TextStyle(
                    fontFamily: 'Red Hat Text',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFFFFFFFF),
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 20),
                // Ingredients
                const Text(
                  "Ingredients",
                  style: TextStyle(
                    fontFamily: 'Merriweather',
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                    color: Color(0xFF304E31),
                  ),
                ),
                const SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: ingredients
                      .map((ingredient) => Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  ingredient['name']!,
                                  style: const TextStyle(
                                    fontFamily: 'Red Hat Display',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF304E31),
                                  ),
                                ),
                                Text(
                                  ingredient['quantity']!,
                                  style: const TextStyle(
                                    fontFamily: 'Red Hat Text',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFFFFFFFF),
                                  ),
                                ),
                              ],
                            ),
                          ))
                      .toList(),
                ),
                const SizedBox(height: 20),
                // Recipe
                const Text(
                  "Recipe",
                  style: TextStyle(
                    fontFamily: 'Merriweather',
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                    color: Color(0xFF304E31),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: const Color(0xFF9AB283),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    recipe,
                    style: const TextStyle(
                      fontFamily: 'Red Hat Display',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF304E31),
                      height: 1.5,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                // Back to menu button
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF304E31),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      "Back to menu",
                      style: TextStyle(
                        fontFamily: 'Red Hat Display',
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
