import 'package:flutter/material.dart';
import 'package:resumebuild/screens/resume_builder.dart';

class TemplateSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Resume Template'),
      ),
      body: SingleChildScrollView(
        child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TemplateCard(
              templateName: 'Template 1',
              imagePath: 'assets/1131w-f5JNR-K5jjw.webp',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResumeFormScreen(template: 'Template 1'),
                  ),
                );
              },
            ),
            TemplateCard(
              templateName: 'Template 2',
              imagePath: 'assets/1131w-pIsBixsev8I.webp',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResumeFormScreen(template: 'Template 2'),
                  ),
                );
              },
            ),
            TemplateCard(
              templateName: 'Template 3',
              imagePath: 'assets/single_column_resume_template_1_c1e24e6e04.png',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResumeFormScreen(template: 'Template 3'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    ));
  }
}

class TemplateCard extends StatelessWidget {
  final String templateName;
  final String imagePath;
  final VoidCallback onTap;

  TemplateCard({required this.templateName, required this.imagePath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset(imagePath),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                templateName,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
