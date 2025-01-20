import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:testline/resultscreen.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List questions = [];
  int currentQuestionIndex = 0;
  int totalScore = 0;
  bool isLoading = true;
  int correctAnswersCount = 0;
  Map<int, int?> selectedOptions = {};

  @override
  void initState() {
    super.initState();
    fetchQuestions();
  }

  Future<void> fetchQuestions() async {
    final response = await http.get(
        Uri.parse('https://api.jsonserve.com/Uw5CrX'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        questions = data['questions'];
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
        backgroundColor: Colors.black,
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : questions.isEmpty
          ? Center(
        child: Text('No questions available',
            style: TextStyle(fontSize: 18,
                fontStyle: FontStyle.italic,
                color: Colors.white70)),
      )
          : Container(
        padding: const EdgeInsets.all(16.0),
        color: Colors.black87,
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                'Question ${currentQuestionIndex + 1}/${questions.length}',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightBlueAccent,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            Card(
              color: Colors.grey.shade800,
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  questions[currentQuestionIndex]['description'],
                  style: TextStyle(fontSize: 18, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 20),
            ..._buildOptions(questions[currentQuestionIndex]['options']),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: currentQuestionIndex > 0
                      ? () {
                    setState(() {
                      currentQuestionIndex--;
                    });
                  }
                      : null,
                  child: Text('Previous', style: TextStyle(fontSize: 18)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    shadowColor: Colors.orangeAccent,
                    elevation: 5,
                  ),
                ),
                ElevatedButton(
                  onPressed: currentQuestionIndex < questions.length - 1
                      ? () {
                    setState(() {
                      currentQuestionIndex++;
                    });
                  }
                      : () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ResultScreen(
                              totalScore: totalScore,
                              totalQuestions: questions.length,
                              correctAnswers: correctAnswersCount,
                            ),
                      ),
                    );
                  },
                  child: Text(currentQuestionIndex < questions.length - 1
                      ? 'Next'
                      : 'Finish',
                      style: TextStyle(fontSize: 18)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlueAccent,
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    shadowColor: Colors.blueAccent,
                    elevation: 5,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildOptions(List<dynamic> options) {
    return options
        .asMap()
        .entries
        .map<Widget>((entry) {
      int idx = entry.key;
      var option = entry.value;
      return Card(
        margin: EdgeInsets.symmetric(vertical: 8),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: selectedOptions[currentQuestionIndex] == idx
            ? Colors.lightBlue
            : Colors.grey.shade700,
        child: ListTile(
          title: Text(option['description'],
              style: TextStyle(fontSize: 16, color: Colors.white)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          onTap: () {
            setState(() {
              selectedOptions[currentQuestionIndex] = idx;
            });
          },
        ),
      );
    }).toList();
  }
}














