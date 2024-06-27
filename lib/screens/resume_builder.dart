import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resumebuild/utils/resume_provider.dart';

class ResumeBuilderScreen extends StatelessWidget {
  const ResumeBuilderScreen({Key? key}) : super(key: key);

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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
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
              ..._buildExperienceFields(context, resumeProvider),
              ElevatedButton(
                onPressed: () {
                  resumeProvider.addToList('experience', {
                    'job_title': '',
                    'company': '',
                    'duration': '',
                    'job_description': '',
                  });
                },
                child: const Text('Add Another Experience', style: TextStyle(fontFamily: 'Montserrat')),
              ),
              const SizedBox(height: 20),
              _buildSectionTitle('Education'),
              ..._buildEducationFields(context, resumeProvider),
              ElevatedButton(
                onPressed: () {
                  resumeProvider.addToList('education', {
                    'degree': '',
                    'institution': '',
                    'duration': '',
                    'description': '',
                  });
                },
                child: const Text('Add Another Education', style: TextStyle(fontFamily: 'Montserrat')),
              ),
              const SizedBox(height: 20),
              _buildSectionTitle('Skills'),
              ..._buildSkillsFields(context, resumeProvider),
              ElevatedButton(
                onPressed: () {
                  resumeProvider.addToList('skills', '');
                },
                child: const Text('Add Another Skill', style: TextStyle(fontFamily: 'Montserrat')),
              ),
              const SizedBox(height: 20),
              _buildSectionTitle('Certifications'),
              ..._buildCertificationsFields(context, resumeProvider),
              ElevatedButton(
                onPressed: () {
                  resumeProvider.addToList('certifications', {
                    'name': '',
                    'organization': '',
                    'date': '',
                  });
                },
                child: const Text('Add Another Certification', style: TextStyle(fontFamily: 'Montserrat')),
              ),
              const SizedBox(height: 20),
              _buildSectionTitle('Projects'),
              ..._buildProjectsFields(context, resumeProvider),
              ElevatedButton(
                onPressed: () {
                  resumeProvider.addToList('projects', {
                    'name': '',
                    'description': '',
                    'technologies': '',
                  });
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontFamily: 'Montserrat', fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildTextField(String label, ResumeProvider resumeProvider, String section, [String? field]) {
    TextEditingController controller = TextEditingController(
      text: field == null ? resumeProvider.resumeData[section] ?? '' : resumeProvider.resumeData[section]?[field] ?? '',
    );

    // Ensure controller is updated with the latest text value
    controller.text = field == null ? resumeProvider.resumeData[section] ?? '' : resumeProvider.resumeData[section]?[field] ?? '';

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
              resumeProvider.updateFieldInSection(section, field, value); // Implement this method in ResumeProvider
            }
          },
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  List<Widget> _buildExperienceFields(BuildContext context, ResumeProvider resumeProvider) {
    List<Widget> experienceFields = [];
    for (int i = 0; i < resumeProvider.resumeData['experience'].length; i++) {
      var item = resumeProvider.resumeData['experience'][i];
      experienceFields.addAll([
        _buildExperienceField('Job Title', resumeProvider, 'experience', 'job_title$i'),
        _buildExperienceField('Company', resumeProvider, 'experience', 'company$i'),
        _buildExperienceField('Duration', resumeProvider, 'experience', 'duration$i'),
        _buildExperienceField('Job Description', resumeProvider, 'experience', 'job_description$i'),
        ElevatedButton(
          onPressed: () {
            resumeProvider.removeFromList('experience', i);
          },
          child: const Text('Remove Experience', style: TextStyle(fontFamily: 'Montserrat')),
        ),
        const SizedBox(height: 20),
      ]);
    }
    return experienceFields;
  }

  Widget _buildExperienceField(String label, ResumeProvider resumeProvider, String section, String field) {
    TextEditingController controller = TextEditingController(
      text: resumeProvider.resumeData[section][field] ?? '',
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontFamily: 'Montserrat', fontSize: 14)),
        const SizedBox(height: 5),
        TextField(
          controller: controller,
          onChanged: (value) {
            resumeProvider.updateFieldInSection(section, field, value);
          },
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  List<Widget> _buildEducationFields(BuildContext context, ResumeProvider resumeProvider) {
    List<Widget> educationFields = [];
    for (int i = 0; i < resumeProvider.resumeData['education'].length; i++) {
      var item = resumeProvider.resumeData['education'][i];
      educationFields.addAll([
        _buildEducationField('Degree', resumeProvider, 'education', 'degree$i'),
        _buildEducationField('Institution', resumeProvider, 'education', 'institution$i'),
        _buildEducationField('Duration', resumeProvider, 'education', 'duration$i'),
        _buildEducationField('Description', resumeProvider, 'education', 'description$i'),
        ElevatedButton(
          onPressed: () {
            resumeProvider.removeFromList('education', i);
          },
          child: const Text('Remove Education', style: TextStyle(fontFamily: 'Montserrat')),
        ),
        const SizedBox(height: 20),
      ]);
    }
    return educationFields;
  }

  Widget _buildEducationField(String label, ResumeProvider resumeProvider, String section, String field) {
    TextEditingController controller = TextEditingController(
      text: resumeProvider.resumeData[section][field] ?? '',
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontFamily: 'Montserrat', fontSize: 14)),
        const SizedBox(height: 5),
        TextField(
          controller: controller,
          onChanged: (value) {
            resumeProvider.updateFieldInSection(section, field, value);
          },
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  List<Widget> _buildSkillsFields(BuildContext context, ResumeProvider resumeProvider) {
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
iconSize: 20,
),
],
),
);
}
return skillsFields;
}

List<Widget> _buildCertificationsFields(BuildContext context, ResumeProvider resumeProvider) {
List<Widget> certificationsFields = [];
for (int i = 0; i < resumeProvider.resumeData['certifications'].length; i++) {
var item = resumeProvider.resumeData['certifications'][i];
certificationsFields.addAll([
_buildCertificationField('Name', resumeProvider, 'certifications', 'name$i'),
_buildCertificationField('Organization', resumeProvider, 'certifications', 'organization$i'),
_buildCertificationField('Date', resumeProvider, 'certifications', 'date$i'),
ElevatedButton(
onPressed: () {
resumeProvider.removeFromList('certifications', i);
},
child: const Text('Remove Certification', style: TextStyle(fontFamily: 'Montserrat')),
),
const SizedBox(height: 20),
]);
}
return certificationsFields;
}

Widget _buildCertificationField(String label, ResumeProvider resumeProvider, String section, String field) {
TextEditingController controller = TextEditingController(
text: resumeProvider.resumeData[section][field] ?? '',
);
return Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(label, style: const TextStyle(fontFamily: 'Montserrat', fontSize: 14)),
const SizedBox(height: 5),
TextField(
controller: controller,
onChanged: (value) {
resumeProvider.updateFieldInSection(section, field, value);
},
),
const SizedBox(height: 10),
],
);
}

List<Widget> _buildProjectsFields(BuildContext context, ResumeProvider resumeProvider) {
List<Widget> projectsFields = [];
for (int i = 0; i < resumeProvider.resumeData['projects'].length; i++) {
var item = resumeProvider.resumeData['projects'][i];
projectsFields.addAll([
_buildProjectField('Name', resumeProvider, 'projects', 'name$i'),
_buildProjectField('Description', resumeProvider, 'projects', 'description$i'),
_buildProjectField('Technologies', resumeProvider, 'projects', 'technologies$i'),
ElevatedButton(
onPressed: () {
resumeProvider.removeFromList('projects', i);
},
child: const Text('Remove Project', style: TextStyle(fontFamily: 'Montserrat')),
),
const SizedBox(height: 20),
]);
}
return projectsFields;
}

Widget _buildProjectField(String label, ResumeProvider resumeProvider, String section, String field) {
TextEditingController controller = TextEditingController(
text: resumeProvider.resumeData[section][field] ?? '',
);
return Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(label, style: const TextStyle(fontFamily: 'Montserrat', fontSize: 14)),
const SizedBox(height: 5),
TextField(
controller: controller,
onChanged: (value) {
resumeProvider.updateFieldInSection(section, field, value);
},
),
const SizedBox(height: 10),
],
);
}
}