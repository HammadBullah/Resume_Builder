import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ResumeProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Map<String, dynamic> resumeData = {
    'personal_info': {},
    'professional_summary': '',
    'experience': [],
    'education': [],
    'skills': [],
    'certifications': [],
    'projects': [],
  };

  Future<void> fetchResumeData() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot doc = await _firestore.collection('resumes').doc(user.uid).get();
      if (doc.exists) {
        resumeData = doc.data() as Map<String, dynamic>;
        notifyListeners();
      }
    }
  }

  Future<void> saveResumeData() async {
    User? user = _auth.currentUser;
    if (user != null) {
      await _firestore.collection('resumes').doc(user.uid).set(resumeData);
    }
  }

  void updateSection(String section, dynamic value) {
    resumeData[section] = value;
    notifyListeners();
  }

  void addToList(String section, dynamic value) {
    if (resumeData[section] is List) {
      resumeData[section].add(value);
      notifyListeners();
    }
  }

  void removeFromList(String section, int index) {
    if (resumeData[section] is List) {
      resumeData[section].removeAt(index);
      notifyListeners();
    }
  }

  void updateListItem(String section, int index, dynamic value) {
    if (resumeData[section] is List) {
      resumeData[section][index] = value;
      notifyListeners();
    }
  }
}
