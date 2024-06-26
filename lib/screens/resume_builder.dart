import 'package:flutter/material.dart';

class ResumeBuilderScreen extends StatelessWidget {
  const ResumeBuilderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resume Builder', style: TextStyle(fontFamily: 'Montserrat')),
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
                      // Save the resume
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Experience', style: TextStyle(fontFamily: 'Montserrat', fontSize: 16)),
                  const TextField(),
                  const SizedBox(height: 10),
                  const Text('Education', style: TextStyle(fontFamily: 'Montserrat', fontSize: 16)),
                  const TextField(),
                  const SizedBox(height: 10),
                  const Text('Skills', style: TextStyle(fontFamily: 'Montserrat', fontSize: 16)),
                  const TextField(),
                  const SizedBox(height: 20),
                  const Text('Resume Preview', style: TextStyle(fontFamily: 'Montserrat', fontSize: 16)),
                  // Placeholder for resume preview
                  Container(
                    height: 200,
                    color: Colors.grey[200],
                    child: const Center(child: Text('Resume Preview Area')),
                  ),
                  const SizedBox(height: 20),
                  const Text('Resume Scoring', style: TextStyle(fontFamily: 'Montserrat', fontSize: 16)),
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
            ],
          ),
        ),
      ),
    );
  }
}
