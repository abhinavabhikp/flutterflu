import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Questions.dart';
import 'Quiz.dart';

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  late List<Question> questions = [];
  int score = 0;
  int currentQuestionIndex = 0;


  @override
  void initState() {
    super.initState();
    fetchQuestions();
  }

  Future<void> fetchQuestions() async {
    final QuerySnapshot snapshot =
    await FirebaseFirestore.instance.collection('quiz').get();
    setState(() {
      questions = snapshot.docs.map((doc) {
        final List<String> options = List.from(doc['options'] as List);
        return Question(
          question: doc['question'].toString(),
          option: options,
          correctAnswer: doc['correctAnswer'].toString(),
        );
      }).toList();
    });
  }

  void answerQuestion(int selectedOptionIndex) {
    final Question currentQuestion = questions[currentQuestionIndex];
    if (selectedOptionIndex == int.parse(currentQuestion.correctAnswer)) {
      setState(() {
        score++;
      });
    }
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Quiz Result'),
            content: Text('Your score is $score'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  setState(() {
                    currentQuestionIndex = 0;
                    score = 0;
                  });
                },
                child: const Text('Restart'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App'),
      ),
      body: (questions != null && questions.isNotEmpty)
          ? QuizWidget(
        questions: questions,
        onAnswerSelected: answerQuestion,
      )
          : const CircularProgressIndicator(),
    );
  }
}