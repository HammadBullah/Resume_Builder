import 'dart:io';

class Profile {
  File? image;
  String name;
  String contactDetails;
  String education;
  String workExperience;
  String skills;

  Profile({
    this.image,
    required this.name,
    required this.contactDetails,
    required this.education,
    required this.workExperience,
    required this.skills,
  });
}
  