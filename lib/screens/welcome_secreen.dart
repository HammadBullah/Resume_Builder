import 'package:flutter/material.dart';
import 'package:resumebuild/utils/theme.dart'; // Import the theme file

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Column(
                children: [
                  // Add your app logo here
                  Image.asset('assets/pexels-sohi-807598.jpg', height: 100),
                  const SizedBox(height: 20),
                  const Text(
                    'Welcome to Resume Builder',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Create a professional resume easily',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  const SizedBox(height: 40),
                  ButtonTheme(
                    minWidth: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 5,

                        backgroundColor: AppColors.primary, 
                        foregroundColor: Colors.white,// Use secondary color from the theme
                        textStyle: const TextStyle(fontFamily: 'Montserrat', color: Colors.white),
                      ),
                      child: const Text('Login'),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ButtonTheme(
                    minWidth: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/signup');
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 5,
                        backgroundColor: const Color.fromARGB(255, 230, 230, 230),
                        foregroundColor: Color.fromARGB(255, 71, 68, 81) ,
                         // Use primary color from the theme
                        textStyle: const TextStyle(fontFamily: 'Montserrat',color: Color.fromARGB(255, 215, 208, 242)),
                      ),
                      child: const Text('Sign Up'),
                    ),
                  ),
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
