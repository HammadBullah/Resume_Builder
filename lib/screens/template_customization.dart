import 'package:flutter/material.dart';

class TemplateCustomizationScreen extends StatelessWidget {
  const TemplateCustomizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Template Customization', style: TextStyle(fontFamily: 'Montserrat')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Template Gallery', style: TextStyle(fontFamily: 'Montserrat', fontSize: 16)),
              // Add template gallery here
              const SizedBox(height: 20),
              const Text('Customize: Font, Color, Layout', style: TextStyle(fontFamily: 'Montserrat', fontSize: 16)),
              // Add customization options here
              const SizedBox(height: 20),
              const Text('Live Preview', style: TextStyle(fontFamily: 'Montserrat', fontSize: 16)),
              Container(
                height: 200,
                color: Colors.grey[200],
                child: const Center(child: Text('Live Preview Area')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
