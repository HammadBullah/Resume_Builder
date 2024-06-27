import 'package:flutter/material.dart';// Import your authentication service

class AuthService {
  // Example method to simulate user authentication
  Future<bool> signIn(String email, String password) async {
    // Simulate a delay for authentication (replace with your actual authentication logic)
    await Future.delayed(Duration(seconds: 2));
    
    // Simulate successful login
    return true;
  }

  // Example method to simulate user logout
  Future<void> signOut(BuildContext context) async {
    // Simulate a delay for logout (replace with your actual logout logic)
    await Future.delayed(Duration(seconds: 1));
    
    // Navigate to the welcome screen and remove all previous routes
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }
}

class HomeScreen extends StatelessWidget {
  final AuthService _authService = AuthService(); // Instance of your AuthService

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Padding(padding: EdgeInsets.all(20),
        child: Text('Home', style: TextStyle(fontFamily: 'Courier New', fontWeight: FontWeight.w700, fontSize: 30)),),
        backgroundColor: Color.fromARGB(255, 224, 174, 26),
        actions: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: IconButton(
            icon: Icon(Icons.person),

            onPressed: () {
              _showProfileMenu(context); // Show profile menu on tap
            },
          ),
        )],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 30,
          mainAxisSpacing: 30,
          children: [
            _buildCard(context, 'Resume Builder', Icons.description, '/resume_builder'),
            _buildCard(context, 'Skill Extraction', Icons.lightbulb, '/skill_extraction'),
            _buildCard(context, 'Interview', Icons.question_answer, '/interview_preparation'),
            _buildCard(context, 'Custom Template', Icons.edit, '/template_customization'),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, String title, IconData icon, String route) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 28, 28, 29), Color.fromARGB(255, 81, 78, 83)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.white),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
        padding: EdgeInsets.all(16),
      ),
    );
  }

  void _showProfileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ListTile(
                leading: Icon(Icons.edit),
                title: Text('Edit Profile'),
                onTap: () {
                  Navigator.pop(context); // Close the modal
                  Navigator.pushNamed(context, '/profile'); // Navigate to profile screen
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Log Out'),
                onTap: () {
                  Navigator.pop(context); // Close the modal
                  _logoutUser(context); // Logout user
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _logoutUser(BuildContext context) {
  _authService.signOut(context); // Call your AuthService signOut method
}

}
