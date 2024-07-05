import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resumebuild/screens/home_screen.dart';
import 'package:resumebuild/screens/interview_screen.dart';
import 'package:resumebuild/screens/login_screen.dart';
import 'package:resumebuild/screens/resume_builder.dart';
import 'package:resumebuild/screens/sighnup_screen.dart';
import 'package:resumebuild/screens/skill_extraction.dart';
import 'package:resumebuild/screens/template_customization.dart';
import 'package:resumebuild/screens/user_profile.dart';
import 'package:resumebuild/screens/welcome_secreen.dart';
import 'package:resumebuild/utils/profile_data.dart';
import 'package:resumebuild/utils/theme.dart';

import 'utils/resume_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProfileProvider()),
        ChangeNotifierProvider(create: (context) => SkillExtractionProvider()),
        ChangeNotifierProvider(create: (context) => ResumeProvider()),
      ],
      child: MaterialApp(
        title: 'Intelligent Resume Builder',
        theme: AppTheme.theme,
        initialRoute: '/',
        routes: {
          '/': (context) => WelcomeScreen(),
          '/login': (context) => LoginScreen(),
          '/signup': (context) => SignUpScreen(),
          '/profile': (context) => ProfileScreen(),
          '/resume_builder': (context) => ResumeFormScreen(),
          '/skill_extraction': (context) => SkillExtractionScreen(),
          '/interview_preparation': (context) => InterviewPreparationScreen(),
          '/template_customization': (context) => TemplateCustomizationScreen(),
          '/home': (context) => HomeScreen(),
        },
      ),
    );
  }
}
