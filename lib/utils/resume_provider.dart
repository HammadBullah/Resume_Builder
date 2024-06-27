import 'package:flutter/foundation.dart';

class ResumeProvider extends ChangeNotifier {
  Map<String, dynamic> _resumeData = {
    'personal_info': {
      'full_name': '',
      'email': '',
      'phone_number': '',
      'address': '',
    },
    'professional_summary': '',
    'experience': [],
    'education': [],
    'skills': [],
    'certifications': [],
    'projects': [],
  };

  // Getter for resumeData
  Map<String, dynamic> get resumeData => _resumeData;

  // Update a section in resumeData
  void updateSection(String section, dynamic value) {
    if (_resumeData.containsKey(section)) {
      _resumeData[section] = value;
      notifyListeners();
    }
  }

  // Update a field within a section in resumeData
  void updateFieldInSection(String section, String field, String value) {
    if (_resumeData.containsKey(section) && _resumeData[section] is Map<String, dynamic>) {
      _resumeData[section][field] = value;
      notifyListeners();
    }
  }

  // Add an item to a list in resumeData
  void addToList(String section, dynamic item) {
    if (_resumeData.containsKey(section) && _resumeData[section] is List<dynamic>) {
      _resumeData[section].add(item);
      notifyListeners();
    }
  }

  // Remove an item from a list in resumeData
  void removeFromList(String section, int index) {
    if (_resumeData.containsKey(section) && _resumeData[section] is List<dynamic>) {
      _resumeData[section].removeAt(index);
      notifyListeners();
    }
  }

  // Save resume data (dummy method)
  void saveResumeData() {
    // Here you can implement logic to save data to a database or storage
    print('Saving resume data...');
    // Example: Firestore.instance.collection('resumes').doc(userId).set(_resumeData);
  }
}
