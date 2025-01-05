import 'package:flutter/material.dart';
import 'ingredients_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Login here",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Color(0xFF304E31),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Welcome back you’ve been missed!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 40),
              Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Email",
                      filled: true,
                      fillColor: const Color(0xFFBC9E5F),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0xFF304E31)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Password",
                      filled: true,
                      fillColor: const Color(0xFFBC9E5F),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0xFF304E31)),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF304E31),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
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
                        builder: (context) => const IngredientsScreen()),
                  );
                },
                child: const Text(
                  "Sign in",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color(0xFF9AB283),
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
