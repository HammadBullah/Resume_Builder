import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resumebuild/utils/resume_provider.dart';

class ResumeBuilderScreen extends StatelessWidget {
  const ResumeBuilderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final resumeProvider = Provider.of<ResumeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resume Builder', style: TextStyle(fontFamily: 'Montserrat')),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              resumeProvider.saveResumeData();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Add a new section
                    },
                    child: const Text('Add Section', style: TextStyle(fontFamily: 'Montserrat')),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      resumeProvider.saveResumeData();
                    },
                    child: const Text('Save', style: TextStyle(fontFamily: 'Montserrat')),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Download the resume
                    },
                    child: const Text('Download', style: TextStyle(fontFamily: 'Montserrat')),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              _buildSectionTitle('Personal Information'),
              _buildTextField('Full Name', resumeProvider, 'personal_info', 'full_name'),
              _buildTextField('Email', resumeProvider, 'personal_info', 'email'),
              _buildTextField('Phone Number', resumeProvider, 'personal_info', 'phone_number'),
              _buildTextField('Address', resumeProvider, 'personal_info', 'address'),
              const SizedBox(height: 20),
              _buildSectionTitle('Professional Summary'),
              _buildTextField('Summary', resumeProvider, 'professional_summary'),
              const SizedBox(height: 20),
              _buildSectionTitle('Experience'),
              ..._buildExperienceFields(resumeProvider),
              ElevatedButton(
                onPressed: () {
                  resumeProvider.addToList('experience', {});
                },
                child: const Text('Add Another Experience', style: TextStyle(fontFamily: 'Montserrat')),
              ),
              const SizedBox(height: 20),
              _buildSectionTitle('Education'),
              ..._buildEducationFields(resumeProvider),
              ElevatedButton(
                onPressed: () {
                  resumeProvider.addToList('education', {});
                },
                child: const Text('Add Another Education', style: TextStyle(fontFamily: 'Montserrat')),
              ),
              const SizedBox(height: 20),
              _buildSectionTitle('Skills'),
              ..._buildSkillsFields(resumeProvider),
              ElevatedButton(
                onPressed: () {
                  resumeProvider.addToList('skills', '');
                },
                child: const Text('Add Another Skill', style: TextStyle(fontFamily: 'Montserrat')),
              ),
              const SizedBox(height: 20),
              _buildSectionTitle('Certifications'),
              ..._buildCertificationsFields(resumeProvider),
              ElevatedButton(
                onPressed: () {
                  resumeProvider.addToList('certifications', {});
                },
                child: const Text('Add Another Certification', style: TextStyle(fontFamily: 'Montserrat')),
              ),
              const SizedBox(height: 20),
              _buildSectionTitle('Projects'),
              ..._buildProjectsFields(resumeProvider),
              ElevatedButton(
                onPressed: () {
                  resumeProvider.addToList('projects', {});
                },
                child: const Text('Add Another Project', style: TextStyle(fontFamily: 'Montserrat')),
              ),
              const SizedBox(height: 20),
              _buildSectionTitle('Resume Preview'),
              Container(
                height: 200,
                color: Colors.grey[200],
                child: const Center(child: Text('Resume Preview Area')),
              ),
              const SizedBox(height: 20),
              _buildSectionTitle('Resume Scoring'),
              ElevatedButton(
                onPressed: () {
                  // Upload resume for scoring
                },
                child: const Text('Upload Resume', style: TextStyle(fontFamily: 'Montserrat')),
              ),
              const SizedBox(height: 20),
              const Text('Score: 85%', style: TextStyle(fontFamily: 'Montserrat', fontSize: 16)),
              const SizedBox(height: 20),
              const Text('Suggestions for Improvement', style: TextStyle(fontFamily: 'Montserrat', fontSize: 16)),
              const Text('1. Improve Summary', style: TextStyle(fontFamily: 'Montserrat')),
              const Text('2. Add More Skills', style: TextStyle(fontFamily: 'Montserrat')),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(title, style: const TextStyle(fontFamily: 'Montserrat', fontSize: 16, fontWeight: FontWeight.bold));
  }

  Widget _buildTextField(String label, ResumeProvider resumeProvider, String section, [String? field]) {
    TextEditingController controller = TextEditingController(
      text: field == null ? resumeProvider.resumeData[section] : resumeProvider.resumeData[section][field],
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontFamily: 'Montserrat', fontSize: 14)),
        const SizedBox(height: 5),
        TextField(
          controller: controller,
          onChanged: (value) {
            if (field == null) {
              resumeProvider.updateSection(section, value);
            } else {
              resumeProvider.resumeData[section][field] = value;
              resumeProvider.notifyListeners();
            }
          },
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  List<Widget> _buildExperienceFields(ResumeProvider resumeProvider) {
    List<Widget> experienceFields = [];
    for (int i = 0; i < resumeProvider.resumeData['experience'].length; i++) {
      experienceFields.addAll([
        _buildTextField('Job Title', resumeProvider, 'experience', '$i.job_title'),
        _buildTextField('Company', resumeProvider, 'experience', '$i.company'),
        _buildTextField('Duration', resumeProvider, 'experience', '$i.duration'),
        _buildTextField('Job Description', resumeProvider, 'experience', '$i.job_description'),
        ElevatedButton(
          onPressed: () {
            resumeProvider.removeFromList('experience', i);
          },
          child: const Text('Remove Experience', style: TextStyle(fontFamily: 'Montserrat')),
        ),
      ]);
    }
    return experienceFields;
  }

  List<Widget> _buildEducationFields(ResumeProvider resumeProvider) {
    List<Widget> educationFields = [];
    for (int i = 0; i < resumeProvider.resumeData['education'].length; i++) {
      educationFields.addAll([
        _buildTextField('Degree', resumeProvider, 'education', '$i.degree'),
        _buildTextField('Institution', resumeProvider, 'education', '$i.institution'),
        _buildTextField('Duration', resumeProvider, 'education', '$i.duration'),
        _buildTextField('Description', resumeProvider, 'education', '$i.description'),
        ElevatedButton(
          onPressed: () {
            resumeProvider.removeFromList('education', i);
          },
          child: const Text('Remove Education', style: TextStyle(fontFamily: 'Montserrat')),
        ),
      ]);
    }
    return educationFields;
  }

  List<Widget> _buildSkillsFields(ResumeProvider resumeProvider) {
    List<Widget> skillsFields = [];
    for (int i = 0; i < resumeProvider.resumeData['skills'].length; i++) {
      TextEditingController controller = TextEditingController(text: resumeProvider.resumeData['skills'][i]);
      skillsFields.add(
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                onChanged: (value) {
                  resumeProvider.resumeData['skills'][i] = value;
                  resumeProvider.notifyListeners();
                },
              ),
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                resumeProvider.removeFromList('skills', i);
              },
            ),
          ],
        ),
      );
    }
    return skillsFields;
  }

  List<Widget> _buildCertificationsFields(ResumeProvider resumeProvider) {
    List<Widget> certificationsFields = [];
    for (int i = 0; i < resumeProvider.resumeData['certifications'].length; i++) {
      certificationsFields.addAll([
        _buildTextField('Certification Name', resumeProvider, 'certifications', '$i.name'),
        _buildTextField('Issuing Organization', resumeProvider, 'certifications', '$i.organization'),
        _buildTextField('Date Obtained', resumeProvider, 'certifications', '$i.date'),
        ElevatedButton(
          onPressed: () {
            resumeProvider.removeFromList('certifications', i);
          },
          child: const Text('Remove Certification', style: TextStyle(fontFamily: 'Montserrat')),
        ),
      ]);
    }
    return certificationsFields;
  }

  List<Widget> _buildProjectsFields(ResumeProvider resumeProvider) {
    List<Widget> projectsFields = [];
    for (int i = 0; i < resumeProvider.resumeData['projects'].length; i++) {
      projectsFields.addAll([
        _buildTextField('Project Name', resumeProvider, 'projects', '$i.name'),
        _buildTextField('Description', resumeProvider, 'projects', '$i.description'),
        _buildTextField('Technologies Used', resumeProvider, 'projects', '$i.technologies'),
        ElevatedButton(
          onPressed: () {
            resumeProvider.removeFromList('projects', i);
          },
          child: const Text('Remove Project', style: TextStyle(fontFamily: 'Montserrat')),
        ),
      ]);
    }
    return projectsFields;
  }
}
