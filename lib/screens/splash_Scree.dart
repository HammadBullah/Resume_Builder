import 'dart:async';
import 'package:flutter/material.dart';
import 'package:resumebuild/screens/welcome_secreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // Animation controller setup
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3), // Total animation duration
    );

    // Scale animation setup
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.5).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.0, 0.5, curve: Curves.easeInOut), // Zoom in for the first half
      ),
    );

    // Start the animation after a delay
    Timer(Duration(milliseconds: 500), () {
      _animationController.forward();
    });

    // Navigate to the main screen after animation completes
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => WelcomeScreen()), // Replace with your main screen
        );
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 55, 55, 55), // Customize as per your design
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedBuilder(
              animation: _scaleAnimation,
              builder: (context, child) {
                return Transform.scale(
                  scale: _scaleAnimation.value,
                  child: child,
                );
              },
              child: Image.asset(
                'assets/Image_06-07-24_at_8.22_PM-removebg-preview.png', // Replace with your logo asset path
                width: 200.0, // Adjust size as needed
                height: 200.0,
              ),
            ),
            SizedBox(height: 30),
            Image.asset(
                'assets/Image_06-07-24_at_8.23_PM-removebg-preview.png', // Replace with your logo asset path
                width: 200.0, // Adjust size as needed
                height: 200.0,
              ),
          ],
        ),
      ),
    );
  }
}
