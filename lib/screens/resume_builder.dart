import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:provider/provider.dart';
import 'package:resumebuild/utils/resume_provider.dart';

class ResumeFormScreen extends StatefulWidget {
  const ResumeFormScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ResumeFormScreenState createState() => _ResumeFormScreenState();
}

class _ResumeFormScreenState extends State<ResumeFormScreen> {
  Future<void> _pickImage(BuildContext context) async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      context.read<ResumeProvider>().setImage(File(pickedFile.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(Icons.person),
              SizedBox(width: 10),
              Text('Resume Builder'),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Consumer<ResumeProvider>(
                builder: (context, provider, child) {
                  return Center(
                    child: Column(
                      children: [
                        provider.image != null
                            ? CircleAvatar(
                                radius: 50,
                                backgroundImage: FileImage(provider.image!),
                              )
                            : const CircleAvatar(
                                radius: 50,
                                child: Icon(Icons.person),
                              ),
                        const SizedBox(height: 20,),
                        TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 47, 47, 47),
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () => _pickImage(context),
                          child: const Text('Pick Image'),
                        ),
                      ],
                    ),
                  );
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Name'),
                onChanged: (value) {
                  context.read<ResumeProvider>().name = value;
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Title'),
                onChanged: (value) {
                  context.read<ResumeProvider>().title = value;
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Summary'),
                onChanged: (value) {
                  context.read<ResumeProvider>().summary = value;
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Phone'),
                onChanged: (value) {
                  context.read<ResumeProvider>().phone = value;
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Email'),
                onChanged: (value) {
                  context.read<ResumeProvider>().email = value;
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Address'),
                onChanged: (value) {
                  context.read<ResumeProvider>().address = value;
                },
              ),
              const SizedBox(height: 20),
              const Text('Education', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Consumer<ResumeProvider>(
                builder: (context, provider, child) {
                  return Column(
                    children: provider.educationList.map((education) {
                      return ListTile(
                        title: Text(education.course),
                        subtitle: Text('${education.school}, ${education.yearEnded}'),
                      );
                    }).toList(),
                  );
                },
              ),
              ElevatedButton(
                onPressed: () {
                  _addEducation(context);
                },
                child: const Text('Add Education'),
              ),
              const SizedBox(height: 20),
              const Text('Experience', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Consumer<ResumeProvider>(
                builder: (context, provider, child) {
                  return Column(
                    children: provider.experienceList.map((experience) {
                      return ListTile(
                        title: Text(experience.jobName),
                        subtitle: Text('${experience.startDate} - ${experience.endDate}'),
                      );
                    }).toList(),
                  );
                },
              ),
              ElevatedButton(
                onPressed: () {
                  _addExperience(context);
                },
                child: const Text('Add Experience'),
              ),
              const SizedBox(height: 20),
              const Text('Skills', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Consumer<ResumeProvider>(
                builder: (context, provider, child) {
                  return Column(
                    children: provider.skills.map((skill) {
                      return ListTile(
                        title: Text(skill),
                      );
                    }).toList(),
                  );
                },
              ),
              ElevatedButton(
                onPressed: () {
                  _addSkill(context);
                },
                child: const Text('Add Skill'),
              ),
              const SizedBox(height: 20),
              const Text('Languages', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Consumer<ResumeProvider>(
                builder: (context, provider, child) {
                  return Column(
                    children: provider.languages.map((language) {
                      return ListTile(
                        title: Text(language),
                      );
                    }).toList(),
                  );
                },
              ),
              ElevatedButton(
                onPressed: () {
                  _addLanguage(context);
                },
                child: const Text('Add Language'),
              ),
              const SizedBox(height: 20),
              const Divider(height: 50, color: Color.fromARGB(255, 213, 213, 213)),
              SizedBox(
                width: double.infinity,
                height: 70,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 209, 157, 0),
                    textStyle: const TextStyle(fontFamily: 'Montserrat'),
                    elevation: 5,
                  ),
                  onPressed: () {
                    generateResumePdf(context);
                  },
                  child: const Text('Generate PDF'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _addEducation(BuildContext context) {
    final courseController = TextEditingController();
    final schoolController = TextEditingController();
    final yearController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Education'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: courseController,
                decoration: const InputDecoration(labelText: 'Course'),
              ),
              TextField(
                controller: schoolController,
                decoration: const InputDecoration(labelText: 'School'),
              ),
              TextField(
                controller: yearController,
                decoration: const InputDecoration(labelText: 'Year Ended'),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                final education = Education(
                  course: courseController.text,
                  school: schoolController.text,
                  yearEnded: yearController.text,
                );
                context.read<ResumeProvider>().educationList.add(education);
                context.read<ResumeProvider>().notifyListeners();
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _addExperience(BuildContext context) {
    final jobNameController = TextEditingController();
    final summaryController = TextEditingController();
    final startDateController = TextEditingController();
    final endDateController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Experience'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: jobNameController,
                decoration: const InputDecoration(labelText: 'Job Name'),
              ),
              TextField(
                controller: summaryController,
                decoration: const InputDecoration(labelText: 'Summary'),
              ),
              TextField(
                controller: startDateController,
                decoration: const InputDecoration(labelText: 'Start Date'),
              ),
              TextField(
                controller: endDateController,
                decoration: const InputDecoration(labelText: 'End Date'),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                final experience = Experience(
                  jobName: jobNameController.text,
                  summary: summaryController.text,
                  startDate: startDateController.text,
                  endDate: endDateController.text,
                );
                context.read<ResumeProvider>().experienceList.add(experience);
                context.read<ResumeProvider>().notifyListeners();
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _addSkill(BuildContext context) {
    final skillController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Skill'),
          content: TextField(
            controller: skillController,
            decoration: const InputDecoration(labelText: 'Skill'),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                context.read<ResumeProvider>().skills.add(skillController.text);
                context.read<ResumeProvider>().notifyListeners();
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _addLanguage(BuildContext context) {
    final languageController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Language'),
          content: TextField(
            controller: languageController,
            decoration: const InputDecoration(labelText: 'Language'),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                context.read<ResumeProvider>().languages.add(languageController.text);
                context.read<ResumeProvider>().notifyListeners();
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  Future<void> generateResumePdf(BuildContext context) async {
    final provider = Provider.of<ResumeProvider>(context, listen: false);

    final pdf = pw.Document();

    final poppinsRegular = await PdfGoogleFonts.poppinsRegular();
    final poppinsBold = await PdfGoogleFonts.poppinsBold();
    final poppinsItalic = await PdfGoogleFonts.poppinsItalic();

    final profileImage = provider.image != null
        ? pw.MemoryImage(provider.image!.readAsBytesSync())
        : null;

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Container(
                width: 200,
                padding: const pw.EdgeInsets.all(8.0),
                color: PdfColors.blue200,
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    if (profileImage != null)
                      pw.Center(
                        child: pw.ClipOval(
                          child: pw.Image(profileImage, width: 150, height: 150), // Adjust size as needed
                        ),
                      ),
                    pw.SizedBox(height: 20),
                    pw.Text(provider.name, style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold, font: poppinsBold)),
                    pw.Text(provider.title, style: pw.TextStyle(fontSize: 18, font: poppinsItalic)),
                    pw.SizedBox(height: 20),
                    pw.Text('Contact', style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold, font: poppinsBold)),
                    pw.Text('Phone: ${provider.phone}', style: pw.TextStyle(font: poppinsRegular)),
                    pw.Text('Email: ${provider.email}', style: pw.TextStyle(font: poppinsRegular)),
                    pw.Text('Address: ${provider.address}', style: pw.TextStyle(font: poppinsRegular)),
                    pw.SizedBox(height: 20),
                    pw.Text('Skills', style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold, font: poppinsBold)),
                    for (var skill in provider.skills)
                      pw.Text(skill, style: pw.TextStyle(font: poppinsRegular)),
                    pw.SizedBox(height: 20),
                    pw.Text('Languages', style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold, font: poppinsBold)),
                    for (var language in provider.languages)
                      pw.Text(language, style: pw.TextStyle(font: poppinsRegular)),
                  ],
                ),
              ),
              pw.SizedBox(width: 20),
              pw.Expanded(
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text('Summary', style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold, font: poppinsBold)),
                    pw.Text(provider.summary, style: pw.TextStyle(font: poppinsRegular)),
                    pw.SizedBox(height: 20),
                    pw.Text('Education', style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold, font: poppinsBold)),
                    for (var education in provider.educationList)
                      pw.Text('${education.course}, ${education.school}, ${education.yearEnded}', style: pw.TextStyle(font: poppinsRegular)),
                    pw.SizedBox(height: 20),
                    pw.Text('Experience', style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold, font: poppinsBold)),
                    for (var experience in provider.experienceList)
                      pw.Text('${experience.jobName}, ${experience.startDate} - ${experience.endDate}\n${experience.summary}', style: pw.TextStyle(font: poppinsRegular)),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );

    await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => pdf.save());
  }
}

