import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'register_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Welcome Image
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('assets/first_image.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Main Heading
            const Text(
              "Enjoy your cocktails at home",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Color(0xFF304E31),
              ),
            ),
            const SizedBox(height: 10),
            // Subtext
            const Text(
              "Explore all the existing job roles based on your\ninterest and study major",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 30),
            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Login Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF304E31),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                // Register Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFBC9E5F),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "Register",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
