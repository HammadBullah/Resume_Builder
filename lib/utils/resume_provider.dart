import 'dart:io';
import 'package:flutter/material.dart';

class ResumeProvider extends ChangeNotifier {
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
  File? image; // Add this line for the image

  void setImage(File image) {
    this.image = image;
    notifyListeners();
  }
}

class Education {
  final String course;
  final String school;
  final String yearEnded;

  Education({
    required this.course,
    required this.school,
    required this.yearEnded,
  });
}

class Experience {
  final String jobName;
  final String summary;
  final String startDate;
  final String endDate;

  Experience({
    required this.jobName,
    required this.summary,
    required this.startDate,
    required this.endDate,
  });
}
