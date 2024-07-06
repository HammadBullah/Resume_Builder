import 'dart:io';

import 'package:flutter/material.dart';
import 'package:resumebuild/utils/profile_model.dart';

class ProfileProvider with ChangeNotifier {
  Profile _profile = Profile(name: '', contactDetails: ''); // Replace with your profile model

  bool _isProfileUpdated = false; // Flag to track profile update status

  // Getter for profile data
  Profile get profile => _profile;

  // Getter for profile update status
  bool get isProfileUpdated => _isProfileUpdated;

  // Method to update profile data
  void updateProfile({
    File? image,
    String? name,
    String? contactDetails,
  }) {
    _profile = Profile(
      image: image ?? _profile.image,
      name: name ?? _profile.name,
      contactDetails: contactDetails ?? _profile.contactDetails,
    );

    // Notify listeners that profile data has changed
    notifyListeners();
  }

  // Method to set profile update status
  void setProfileUpdated() {
    _isProfileUpdated = true;
    notifyListeners(); // Notify listeners that profile update status has changed
  }
}
