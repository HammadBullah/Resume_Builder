import 'package:flutter/material.dart';

class InterviewPreparationScreen extends StatelessWidget {
  const InterviewPreparationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interview Preparation', style: TextStyle(fontFamily: 'Montserrat')),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Interview Questions', style: TextStyle(fontFamily: 'Montserrat', fontSize: 16)),
              Text('Q1. Tell me about yourself.', style: TextStyle(fontFamily: 'Montserrat')),
              Text('Q2. Why this job?', style: TextStyle(fontFamily: 'Montserrat')),
              SizedBox(height: 20),
              Text('Notes', style: TextStyle(fontFamily: 'Montserrat', fontSize: 16)),
              TextField(
                maxLines: 5,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              Text('Tips and Best Practices', style: TextStyle(fontFamily: 'Montserrat', fontSize: 16)),
              // Add tips content here
            ],
          ),
        ),
      ),
    );
  }
}
