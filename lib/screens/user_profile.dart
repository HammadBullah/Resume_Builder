import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:resumebuild/utils/profile_data.dart';
import 'package:resumebuild/utils/profile_model.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _educationController = TextEditingController();
  final TextEditingController _workController = TextEditingController();
  final TextEditingController _skillsController = TextEditingController();
  File? _image;
  bool _isPickingImage = false; // Track if image picker is active

  @override
  void initState() {
    super.initState();
    final profile = Provider.of<ProfileProvider>(context, listen: false).profile;
    _nameController.text = profile.name;
    _contactController.text = profile.contactDetails;
    _image = profile.image;
  }

  Future<void> _pickImage() async {
    if (_isPickingImage) {
      // Image picker is already active, do not proceed
      return;
    }
    
    setState(() {
      _isPickingImage = true;
    });

    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      _isPickingImage = false; // Reset image picker flag
    });

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile', style: TextStyle(fontFamily: 'Montserrat', fontSize: 18, fontWeight: FontWeight.bold)),
        backgroundColor: const Color.fromARGB(255, 209, 157, 0),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: GestureDetector(
                  onTap: _pickImage,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: _image != null ? FileImage(_image!) : null,
                    child: _image == null
                        ? const Icon(Icons.add_a_photo, size: 50)
                        : null,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text('Name', style: TextStyle(fontFamily: 'Montserrat', fontSize: 16)),
              TextField(controller: _nameController),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      final profileProvider = Provider.of<ProfileProvider>(context, listen: false);
                      profileProvider.updateProfile(
                        image: _image,
                        name: _nameController.text,
                        contactDetails: _contactController.text,
                      );

                      // Set the flag that profile update is complete
                      profileProvider.setProfileUpdated();

                      // Navigate to home screen
                      Navigator.pushNamed(context, '/home');
                    },
                    child: const Text('Save & Continue', style: TextStyle(fontFamily: 'Montserrat')),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
