import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SkillExtractionProvider with ChangeNotifier {
  String _jobDescription = '';
  List<String> _skills = [];
  bool _isLoading = false;

  String get jobDescription => _jobDescription;

  set jobDescription(String value) {
    _jobDescription = value;
    notifyListeners();
  }

  List<String> get skills => _skills;
  bool get isLoading => _isLoading;

  Future<void> extractSkills() async {
    _isLoading = true;
    notifyListeners();

    // List of common skills to match against
    final commonSkills = [
      'java', 'cloud', 'computing', 'python', 'javascript', 'react', 'angular',
      'vue', 'nodejs', 'express', 'mongodb', 'mysql', 'sql', 'aws', 'azure',
      'google cloud', 'machine-learning', 'artificial intelligence', 'data science',
      'data analysis', 'data visualization', 'statistics', 'mathematics', 'c++',
      'c#', 'c', 'swift', 'kotlin', 'ruby', 'php', 'go', 'rust', 'typescript',
      'html', 'css', 'sass', 'less', 'bootstrap', 'material design', 'ui design',
      'ux design', 'devops', 'agile', 'scrum', 'kanban', 'project management',
      'leadership', 'communication', 'team management', 'time management',
      'problem solving', 'critical thinking', 'collaboration', 'adaptability',
      'android', 'ios', 'flutter', 'react native', 'ionic', 'xamarin', 'cordova',
      'phonegap', 'web development', 'mobile development', 'desktop development',
      'game development', 'database administration', 'network administration',
      'cybersecurity', 'information security', 'penetration testing',
      'vulnerability assessment', 'compliance', 'audit', 'risk management',
      'software development', 'problem-solving', 'Marketing-Specialist',
      'computer science', 'computer engineering', 'networks', 'algorithms',
      'data structures', 'operating systems', 'database systems',
      'software engineering', 'web programming', 'mobile programming',
      'object-oriented programming', 'parallel computing', 'cloud computing',
      'distributed computing', 'artificial intelligence', 'machine learning',
      'natural language processing', 'computer vision', 'image processing',
      'cybersecurity', 'blockchain', 'big data', 'data mining', 'robotics',
      'internet of things', 'virtual reality', 'augmented reality',
      'human-computer interaction', 'user interface design', 'user experience design',
      'software testing', 'quality assurance', 'debugging', 'version control',
      'agile methodologies', 'scrum', 'kanban', 'technical writing', 'research',
      'project management', 'team leadership', 'teamwork', 'problem-solving',
      'critical thinking', 'analytical skills', 'mathematics', 'physics', 'electronics',
      'telecommunications', 'computer graphics', 'computational theory',
      'compiler construction', 'network security', 'information theory',
      'system architecture', 'computer ethics', 'data ethics', 'privacy',
      'computer forensics', 'cloud security', 'IoT security', 'software architecture',
      // Additional skills (extend as needed)
    ];

    // Split job description into words using RegExp to handle punctuation and spaces
    final words = _jobDescription.toLowerCase().split(RegExp(r'\W+')).where((word) => word.isNotEmpty).toList();

    // Filter words against common skills
    final extractedSkills = <String>{};
    for (final word in words) {
      if (commonSkills.contains(word)) {
        extractedSkills.add(word);
      }
    }

    // Sort skills by frequency or relevance if needed
    final sortedSkills = extractedSkills.toList(); // You can sort based on your requirements

    // Assign all extracted skills
    _skills = sortedSkills;
    _isLoading = false;
    notifyListeners();
  }
}

class SkillExtractionScreen extends StatelessWidget {
  const SkillExtractionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Skill Extraction', style: TextStyle(fontFamily: 'Montserrat', fontSize: 18, fontWeight: FontWeight.bold)),
        backgroundColor: const Color.fromARGB(255, 209, 157, 0),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Paste Job Description', style: TextStyle(fontFamily: 'Montserrat', fontSize: 16, color: Colors.grey[600])),
              const SizedBox(height: 10),
              TextField(
                maxLines: 5,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding: const EdgeInsets.all(16),
                ),
                onChanged: (value) {
                  context.read<SkillExtractionProvider>().jobDescription = value;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  context.read<SkillExtractionProvider>().extractSkills();
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue, // Replace with your color from AppColors.primary
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('Extract Skills', style: TextStyle(fontFamily: 'Montserrat', fontSize: 16)),
              ),
              const SizedBox(height: 20),
              Text('Suggested Skills', style: TextStyle(fontFamily: 'Montserrat', fontSize: 16, color: Colors.grey[600])),
              Consumer<SkillExtractionProvider>(
                builder: (context, provider, child) {
                  if (provider.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (provider.skills.isEmpty) {
                    return Text('No skills extracted yet.', style: TextStyle(color: Colors.grey[600]));
                  } else {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: provider.skills.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListTile(
                            title: Text(provider.skills[index], style: const TextStyle(fontFamily: 'Montserrat', fontSize: 16)),
                          ),
                        );
                      },
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
