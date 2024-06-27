import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';

import 'package:resumebuild/utils/theme.dart';

class ResumeBuilderScreen extends StatefulWidget {
  @override
  _ResumeBuilderScreenState createState() => _ResumeBuilderScreenState();
}

class _ResumeBuilderScreenState extends State<ResumeBuilderScreen> {
  final _formKey = GlobalKey<FormState>();

  String? _fullName, _email, _phoneNumber, _address;
  String? _professionalSummary;
  List<Experience> _experience = [];
  List<Education> _education = [];
  List<String> _skills = [];
  List<String> _certifications = [];
  List<String> _projects = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resume Builder'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Full Name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your full name';
                  }
                  return null;
                },
                onSaved: (value) => _fullName = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value!.isEmpty || value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
                onSaved: (value) => _email = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Phone Number'),
                validator: (value) {
                  if (value!.isEmpty || value.length < 10) {
                    return 'Please enter a valid phone number';
                  }
                  return null;
                },
                onSaved: (value) => _phoneNumber = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Address'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your address';
                  }
                  return null;
                },
                onSaved: (value) => _address = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Professional Summary'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your professional summary';
                  }
                  return null;
                },
                onSaved: (value) => _professionalSummary = value,
              ),
              SizedBox(height: 20),
              Text('Experience:'),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _experience.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Work Type'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your work type';
                            }
                            return null;
                          },
                          onSaved: (value) => _experience[index].workType = value!,
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Work Beginning Date'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your work beginning date';
                            }
                            return null;
                          },
                          onSaved: (value) => _experience[index].beginDate = value!,
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Work End Date'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your work end date';
                            }
                            return null;
                          },
                          onSaved: (value) => _experience[index].endDate = value!,
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Work Description'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your work description';
                            }
                            return null;
                          },
                          onSaved: (value) => _experience[index].description = value!,
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        setState(() {
                          _experience.removeAt(index);
                        });
                      },
                    ),
                  );
                },
              ),
              ElevatedButton(
                child: Text('Add Experience'),
                onPressed: () {
                  setState(() {
                    _experience.add(Experience());
                  });
                },
              ),
              SizedBox(height: 20),
              Text('Education:'),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _education.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(labelText: 'School/Campus'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your school/campus';
                            }
                            return null;
                          },
                          onSaved: (value) => _education[index].school = value!,
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Area of Study'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your area of study';
                            }
                            return null;
                          },
                          onSaved: (value) => _education[index].areaOfStudy = value!,
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Marks'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your marks';
                            }
                            return null;
                          },
                          onSaved: (value) => _education[index].marks = value!,
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        setState(() {
                          _education.removeAt(index);
                        });
                      },
                    ),
                  );
                },
              ),
              ElevatedButton(
                child: Text('Add Education'),
                onPressed: () {
                  setState(() {
                    _education.add(Education());
                  });
                },
              ),
              SizedBox(height: 20),
              Text('Skills:'),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _skills.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: TextFormField(
                      decoration: InputDecoration(labelText: 'Skill $index'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your skill';
                        }
                        return null;
                      },
                      onSaved: (value) => _skills[index] = value!,
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        setState(() {
                          _skills.removeAt(index);
                        });
                      },
                    ),
                  );
                },
              ),
              ElevatedButton(
                child: Text('Add Skill'),
                onPressed: () {
                  setState(() {
                    _skills.add('');
                  });
                },
              ),
              SizedBox(height: 20),
              Text('Certifications:'),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _certifications.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: TextFormField(
                      decoration: InputDecoration(labelText: 'Certification $index'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your certification';
                        }
                        return null;
                      },
                      onSaved: (value) => _certifications[index] = value!,
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        setState(() {
                          _certifications.removeAt(index);
                        });
                      },
                    ),
                  );
                },
              ),
              ElevatedButton(
                child: Text('Add Certification'),
                onPressed: () {
                  setState(() {
                    _certifications.add('');
                  });
                },
              ),
              SizedBox(height: 20),
              Text('Projects:'),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _projects.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: TextFormField(
                      decoration: InputDecoration(labelText: 'Project $index'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your project';
                        }
                        return null;
                      },
                      onSaved: (value) => _projects[index] = value!,
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        setState(() {
                          _projects.removeAt(index);
                        });
                      },
                    ),
                  );
                },
              ),
              ElevatedButton(
                child: Text('Add Project'),
                onPressed: () {
                  setState(() {
                    _projects.add('');
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text('Generate Resume'),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    final pdf = pw.Document();
                    pdf.addPage(pw.MultiPage(
                      build: (pw.Context context) {
                        return [
                          pw.Center(
                            child: pw.Text(
                              'Resume',
                              style: pw.TextStyle(fontSize: 24),
                            ),
                          ),
                          pw.SizedBox(height: 20),
                          pw.Text('Full Name: $_fullName'),
                          pw.Text('Email: $_email'),
                          pw.Text('Phone Number: $_phoneNumber'),
                          pw.Text('Address: $_address'),
                          pw.SizedBox(height: 20),
                          pw.Text('Professional Summary:'),
                          pw.Text(_professionalSummary?? ''),
                          pw.SizedBox(height: 20),
                          pw.Text('Experience:'),
                         ..._experience.map((experience) {
                            return pw.Column(
                              children: [
                                pw.Text('Work Type: ${experience.workType}'),
                                pw.Text('Work Beginning Date:${experience.beginDate}'),
                                pw.Text('Work End Date: ${experience.endDate}'),
                                pw.Text('Work Description: ${experience.description}'),
                              ],
                            );
                          }),
                          pw.SizedBox(height: 20),
                          pw.Text('Education:'),
                        ..._education.map((education) {
                            return pw.Column(
                              children: [
                                pw.Text('School/Campus: ${education.school}'),
                                pw.Text('Area of Study: ${education.areaOfStudy}'),
                                pw.Text('Marks: ${education.marks}'),
                              ],
                            );
                          }),
                          pw.SizedBox(height: 20),
                          pw.Text('Skills:'),
                        ..._skills.map((skill) => pw.Text(skill)),
                          pw.SizedBox(height: 20),
                          pw.Text('Certifications:'),
                        ..._certifications.map((certification) => pw.Text(certification)),
                          pw.SizedBox(height: 20),
                          pw.Text('Projects:'),
                        ..._projects.map((project) => pw.Text(project)),
                        ];
                      },
                    ));
                    final directory = await getApplicationDocumentsDirectory();
                    final file = File('${directory.path}/resume.pdf');
                    await file.writeAsBytes(await pdf.save());
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Resume generated successfully!'),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class Experience {
  String? workType;
  String? beginDate;
  String? endDate;
  String? description;
}

class Education {
  String? school;
  String? areaOfStudy;
  String? marks;
}

  
class ResumeScoring {
  static const int MAX_SCORE = 8;

  int calculateScore(Resume resume) {
    int score = 0;
    if (resume.fullName!.isNotEmpty) score++;
    if (resume.email!.isNotEmpty) score++;
    if (resume.phoneNumber!.isNotEmpty) score++;
    if (resume.address!.isNotEmpty) score++;
    if (resume.professionalSummary!.isNotEmpty) score++;
    if (resume.experience!.length > 0) score++;
    if (resume.education!.length > 0) score++;
    if (resume.skills!.length > 0) score++;
    if (resume.certifications!.length > 0) score++;
    if (resume.projects!.length > 0) score++;
    return score;
  }

  String getScoreText(int score) {
    if (score < MAX_SCORE / 2) {
      return 'Weak';
    } else if (score < MAX_SCORE * 3 / 4) {
      return 'Average';
    } else {
      return 'Strong';
    }
  }
}

class Resume {
  String? fullName;
  String? email;
  String? phoneNumber;
  String? address;
  String? professionalSummary;
  List<String>? experience;
  List<String>? education;
  List<String>? skills;
  List<String>? certifications;
  List<String>? projects;
}