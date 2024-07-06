import 'dart:async';

import 'package:flutter/material.dart';

class AuthService {
  // Example method to simulate user authentication

  // Example method to simulate user logout
  Future<void> signOut(BuildContext context) async {
    // Simulate a delay for logout (replace with your actual logout logic)
    await Future.delayed(Duration(seconds: 1));
    
    // Navigate to the welcome screen and remove all previous routes
    Navigator.pushNamedAndRemoveUntil(context, '/welcome', (route) => false);
  }
}
