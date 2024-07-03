import 'package:flutter/material.dart';

class Education {
  String course;
  String school;
  String yearEnded;

  Education({required this.course, required this.school, required this.yearEnded});
}

class Experience {
  String jobName;
  String summary;
  String startDate;
  String endDate;

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

  // Methods to update these fields and notify listeners
}
