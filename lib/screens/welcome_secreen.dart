import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:resumebuild/screens/sighnup_screen.dart';
import 'package:resumebuild/utils/theme.dart'; // Import your theme file
import 'login_screen.dart'; // Import your LoginScreen widget

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int _currentPage = 0;

  final pages = [
    Container(
      color: const Color.fromARGB(255, 37, 37, 37),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/resume-assessment.png'),
          const SizedBox(height: 20),
          const Text(
            'Welcome to Resume Builder',
            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 10),
          const Text(
            'Create a professional resume easily',
            style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.normal),
          ),
        ],
      ),
    ),
    const LoginScreen(), // Replace with your LoginScreen widget
    const SignUpScreen(), // Replace with your SignUpScreen widget
  ];

  final pageTitles = [
    'Welcome Screen',
    'Login Screen',
    'Sign Up Screen',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          LiquidSwipe(
            pages: pages,
            enableLoop: false,
            waveType: WaveType.liquidReveal,
            fullTransitionValue: 400,
            onPageChangeCallback: (page) {
              setState(() {
                _currentPage = page;
              });
            },
          ),
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 100),
                child: _currentPage == 0
                    ? Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.black, border: Border.all(color: Colors.white)),
                            child: const Icon(Icons.arrow_right_rounded, color: Colors.white, size: 50),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Swipe to Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                          const SizedBox(height: 20),
                           Container(
                                decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.black, border: Border.all(color: Colors.white)),
                                child: const Icon(Icons.arrow_right_rounded, color: Colors.white, size: 50),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'Swipe to Signup',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontFamily: 'Montserrat',
                                ),
                              ),
                        ],
                      )
                    : _currentPage == 1
                        ? Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.black, border: Border.all(color: Colors.white)),
                                child: const Icon(Icons.arrow_right_rounded, color: Colors.white, size: 50),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'Swipe to Signup',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 41, 40, 40),
                                  fontFamily: 'Montserrat',
                                ),
                              ),
                            ],
                          )
                        : _currentPage == 2
                        ? Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.black, border: Border.all(color: Colors.white)),
                                child: const Icon(Icons.arrow_left_rounded, color: Colors.white, size: 50),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'Swipe to Login',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 41, 40, 40),
                                  fontFamily: 'Montserrat',
                                ),
                              ),
                            ],
                          )
                                      : const SizedBox.shrink(),

              ),
            ),
          ),
        ],
      ),
    );
  }
}
