import 'dart:io';

class Profile {
  File? image;
  String name;
  String contactDetails;

  Profile({
    this.image,
    required this.name,
    required this.contactDetails,
  });
}
  