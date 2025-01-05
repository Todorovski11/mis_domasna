import 'package:flutter/material.dart';
import 'suggestions_screen.dart';

class IngredientsScreen extends StatelessWidget {
  const IngredientsScreen({super.key});

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Groceries",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                      color: Color(0xFF304E31),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFBC9E5F),
                      padding: const EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      // Add more functionality
                    },
                    child: const Icon(Icons.add, color: Color(0xFF304E31)),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView(
                  children: [
                    _groceryItem("Vodka"),
                    _groceryItem("Gin"),
                    _groceryItem("Gold Rum"),
                    _groceryItem("Black Rum"),
                    _groceryItem("White Rum"),
                    _groceryItem("Blue Curacao"),
                    _groceryItem("Whiskey"),
                    _groceryItem("Kognac"),
                    _groceryItem("Lemon"),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF304E31),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    shadowColor: const Color(0xFFCBD6FF),
                    elevation: 10,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SuggestionsScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "Done",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color(0xFF9AB283),
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

  Widget _groceryItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFF304E31), width: 2),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          const SizedBox(width: 15),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF304E31),
            ),
          ),
        ],
      ),
    );
  }
}
