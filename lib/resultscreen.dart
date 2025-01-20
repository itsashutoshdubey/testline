import 'package:flutter/material.dart';
import 'package:testline/home.dart';
import 'package:testline/quizscreen.dart';

class ResultScreen extends StatelessWidget {
  final int totalScore;
  final int totalQuestions;
  final int correctAnswers;

  ResultScreen({required this.totalScore, required this.totalQuestions, required this.correctAnswers});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Results'),
        backgroundColor: Colors.black,
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        color: Colors.black87,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            Center(
              child: Text(
                'Congratulations!',
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
                'You have completed the quiz!',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white70,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: Text(
                'Your Score:',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightBlueAccent,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                '7/10',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: Text('Back to Home', style: TextStyle(fontSize: 18)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
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
          ],
        ),
      ),
    );
  }
}



