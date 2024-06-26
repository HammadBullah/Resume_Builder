import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home', style: TextStyle(fontFamily: 'Montserrat')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            _buildCard(context, 'Profile', Icons.person, '/profile'),
            _buildCard(context, 'Resume Builder', Icons.description, '/resume_builder'),
            _buildCard(context, 'Skill Extraction', Icons.lightbulb, '/skill_extraction'),
            _buildCard(context, 'Interview Preparation', Icons.question_answer, '/interview_preparation'),
            _buildCard(context, 'Template Customization', Icons.edit, '/template_customization'),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, String title, IconData icon, String route) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40),
          SizedBox(height: 10),
          Text(title, style: TextStyle(fontFamily: 'Montserrat', fontSize: 16)),
        ],
      ),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, backgroundColor: Colors.blue,
        padding: EdgeInsets.all(16),
      ),
    );
  }
}
