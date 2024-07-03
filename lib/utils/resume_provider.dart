import 'dart:typed_data';
import 'package:flutter/material.dart';

class Education {
  final String course;
  final String school;
  final String yearEnded;

  Education({required this.course, required this.school, required this.yearEnded});
}

class Experience {
  final String jobName;
  final String summary;
  final String startDate;
  final String endDate;

  Experience({required this.jobName, required this.summary, required this.startDate, required this.endDate});
}

class ResumeProvider with ChangeNotifier {
  String name = '';
  String title = '';
  String summary = '';
  String phone = '';
  String email = '';
  String address = '';
  List<Education> educationList = [];
  List<Experience> experienceList = [];
  List<String> skills = [];
  List<String> languages = [];
  Uint8List? photo;

  void addEducation(Education education) {
    educationList.add(education);
    notifyListeners();
  }

  void addExperience(Experience experience) {
    experienceList.add(experience);
    notifyListeners();
  }

  void addSkill(String skill) {
    skills.add(skill);
    notifyListeners();
  }

  void addLanguage(String language) {
    languages.add(language);
    notifyListeners();
  }

  void setPhoto(Uint8List? newPhoto) {
    photo = newPhoto;
    notifyListeners();
  }
}
