import 'package:flutter/material.dart';
import 'package:testline/quizscreen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.flash_on, color: Colors.lightBlueAccent),
            SizedBox(width: 10),
            Text('Testline Quiz App'),
          ],
        ),
        backgroundColor: Colors.black,
        elevation: 10,
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.lightBlueAccent),
            onPressed: () {

            },
          ),
          IconButton(
            icon: Icon(Icons.account_circle, color: Colors.lightBlueAccent),
            onPressed: () {

            },
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        color: Colors.black87,
        child: ListView(
          children: [
            SizedBox(height: 20),
            Center(
              child: Text(
                'Welcome to Testline Quiz App!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightBlueAccent,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                'Get ready to challenge yourself and boost your knowledge!',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white70,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 30),
            _buildButton(
              context,
              'Start Quiz',
              Icons.play_arrow,
              Colors.teal,
                  () {
                // Navigate to quiz screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuizScreen()),
                );
              },
            ),
            _buildButton(
              context,
              'View Leaderboard',
              Icons.leaderboard,
              Colors.orange,
                  () {

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LeaderboardScreen()),
                );
              },
            ),
            _buildButton(
              context,
              'Settings',
              Icons.settings,
              Colors.blue,
                  () {

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()),
                );
              },
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'Powered by Testline',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white54,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String title, IconData icon, Color color, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, size: 30),
        label: Text(title, style: TextStyle(fontSize: 18)),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          textStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          shadowColor: Colors.black26,
          elevation: 5,
        ),
      ),
    );
  }
}




class LeaderboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Leaderboard')),
      body: Center(
        child: Text('This is the Leaderboard Screen!'),
      ),
    );
  }
}


class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Center(
        child: Text('This is the Settings Screen!'),
      ),
    );
  }
}

