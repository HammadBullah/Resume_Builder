import 'package:flutter/material.dart';

class SkillExtractionScreen extends StatelessWidget {
  const SkillExtractionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Skill Extraction', style: TextStyle(fontFamily: 'Montserrat')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Paste Job Description', style: TextStyle(fontFamily: 'Montserrat', fontSize: 16)),
            const TextField(
              maxLines: 5,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Extract skills
              },
              child: const Text('Extract Skills', style: TextStyle(fontFamily: 'Montserrat')),
            ),
            const SizedBox(height: 20),
            const Text('Suggested Skills', style: TextStyle(fontFamily: 'Montserrat', fontSize: 16)),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Skill 1', style: TextStyle(fontFamily: 'Montserrat')),
                Text('Skill 2', style: TextStyle(fontFamily: 'Montserrat')),
                Text('Skill 3', style: TextStyle(fontFamily: 'Montserrat')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
