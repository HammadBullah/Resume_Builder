import 'dart:io';
import 'package:flutter/foundation.dart';

import 'profile_model.dart';

class ProfileProvider with ChangeNotifier {
  Profile _profile = Profile(
    name: '',
    contactDetails: '',
    education: '',
    workExperience: '',
    skills: '',
  );

  Profile get profile => _profile;

  void updateProfile({
    File? image,
    String? name,
    String? contactDetails,
    String? education,
    String? workExperience,
    String? skills,
  }) {
    _profile = Profile(
      image: image ?? _profile.image,
      name: name ?? _profile.name,
      contactDetails: contactDetails ?? _profile.contactDetails,
      education: education ?? _profile.education,
      workExperience: workExperience ?? _profile.workExperience,
      skills: skills ?? _profile.skills,
    );
    notifyListeners();
  }
}
