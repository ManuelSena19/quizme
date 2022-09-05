import 'package:flutter/material.dart';
import 'constants/routes.dart';
import 'answer_handler.dart';

class AlgebraQuizView extends StatefulWidget {
  const AlgebraQuizView({Key? key}) : super(key: key);

  @override
  State<AlgebraQuizView> createState() => _AlgebraQuizViewState();
}

class _AlgebraQuizViewState extends State<AlgebraQuizView> {
  final List<Icon> _scoreTracker = [];
  int _questionIndex = 0;
  int _totalScore = 0;
  bool answerWasSelected = false;
  bool endOfQuiz = false;
  bool correctAnswerSelected = false;
  void _questionAnswered(bool answerScore) {
    setState(() {
      answerWasSelected = true;
      if (answerScore) {
        _totalScore++;
        correctAnswerSelected = true;
      }
      _scoreTracker.add(answerScore
          ? const Icon(
        Icons.check_circle,
        color: Colors.green,
      )
          : const Icon(
        Icons.clear,
        color: Colors.red,
      ));
      if (_questionIndex + 1 == _questions.length) {
        endOfQuiz = true;
      }
    });
  }

  void _nextQuestion() {
    setState(() {
      _questionIndex++;
      answerWasSelected = false;
      correctAnswerSelected = false;
    });
    if (_questionIndex >= _questions.length) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(notificationRoute);
              },
              icon: const Icon(Icons.notifications))
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Row(
              children: [
                if (_scoreTracker.isEmpty)
                  const Padding(padding: EdgeInsets.fromLTRB(0, 25, 0, 0)),
                if (_scoreTracker.isNotEmpty) ..._scoreTracker
              ],
            ),
            Container(
              width: double.infinity,
              height: 250,
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text(
                  _questions[_questionIndex]['question'].toString(),
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ...(_questions[_questionIndex]['answers']
            as List<Map<String, Object>>)
                .map(
                  (answer) => Answer(
                answerText: answer['answerText'].toString(),
                answerTap: () {
                  if (answerWasSelected) {
                    return;
                  }
                  _questionAnswered(answer['score'] as bool);
                },
                answerColor: answerWasSelected
                    ? (answer['score'] as bool ? Colors.green : Colors.red)
                    : Colors.transparent,
              ),
            ),
            const Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, 40),
                ),
                onPressed: () {
                  if (!answerWasSelected) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Please select an answer')));
                    return;
                  }
                  _nextQuestion();
                },
                child: Text(endOfQuiz ? 'Close' : 'Next')),
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                "$_totalScore/10",
                style:
                const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
            if (answerWasSelected && !endOfQuiz)
              Container(
                height: 100,
                width: double.infinity,
                color: correctAnswerSelected ? Colors.green : Colors.red,
                child: Center(
                  child: Text(
                    correctAnswerSelected ? 'You got it right' : 'Wrong answer',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            if (endOfQuiz)
              Container(
                height: 100,
                width: double.infinity,
                color: Colors.transparent,
                child: Center(
                  child: Text(
                    _totalScore >= 5
                        ? "Congratulations your final score is: $_totalScore"
                        : "Better luck next time, your final score is: $_totalScore",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: _totalScore >= 5 ? Colors.green : Colors.red,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

final _questions = [
  {
    'question':
    "Solve the equations using Gauss Jordan method: [x+y+z=9], [2x-3y+4z=13], [3x+4y+5z=40]",
    'answers': [
      {'answerText': 'x=1, y=3, z=7', 'score': false},
      {'answerText': 'x=1, y=3, z=2', 'score': false},
      {'answerText': 'x=1, y=3, z=5', 'score': true},
    ],
  },
  {
    'question':
    "Numerical techniques more commonly involve _______",
    'answers': [
      {'answerText': 'Elimination method', 'score': false},
      {'answerText': 'Reduction method', 'score': false},
      {'answerText': 'Iterative method', 'score': true},
    ],
  },
  {
    'question': "If approximate solution of the set of equations, 2x+2y-z = 6, x+y+2z = 8 and -x+3y+2z = 4, is given by x = 2.8 y = 1 and z = 1.8. Then, what is the exact solution?",
    'answers': [
      {'answerText': 'x = 1, y = 3, z = 2', 'score': false},
      {'answerText': 'x = 3, y = 1, z = 2', 'score': true},
      {'answerText': 'x = 1, y = 2, z = 2', 'score': false},
    ],
  },
  {
    'question':
    "Errors may occur in performing numerical computation on the computer due to which of the following reasons?",
    'answers': [
      {'answerText': 'Rounding errors', 'score': true},
      {'answerText': 'Operator fatigue', 'score': false},
      {'answerText': 'Back substitution', 'score': false},
    ],
  },
  {
    'question':
    "What is the value of the determinant [3, 5, 2], [7, 4, 1], [1, 2, 3]?",
    'answers': [
      {'answerText': '-56', 'score': false},
      {'answerText': '-54', 'score': true},
      {'answerText': '-66', 'score': false},
    ],
  },
  {
    'question': "Which of the methods is a direct method for solving simultaneous algebraic equations?",
    'answers': [
      {'answerText': "Cramer’s rule", 'score': true},
      {
        'answerText': "Jacobi’s method",
        'score': false
      },
      {
        'answerText': "Relaxation method",
        'score': false
      },
    ],
  },
  {
    'question': "If EF exists, then (EF)-1 will be equal to which of the following?",
    'answers': [
      {'answerText': 'F-1 E-1', 'score': false},
      {
        'answerText': 'EF',
        'score': false
      },
      {
        'answerText': 'E-1 F-1',
        'score': true
      },
    ],
  },
  {
    'question': "Matrix which does not have an inverse by solving it, is classified as which of the following?",
    'answers': [
      {'answerText': 'Singular matrix', 'score': true},
      {'answerText': 'Non-singular matrix', 'score': false},
      {'answerText': 'Linear matrix', 'score': false},
    ],
  },
  {
    'question': "Apply Gaussian Elimination method to solve the following equations: [2x – y + 3z = 9], [x + y + z = 6], [x – y + z = 2]",
    'answers': [
      {'answerText': 'x = 13, y = 1, z = -8', 'score': false},
      {'answerText': 'x = -13, y = 1, z = -8', 'score': false},
      {'answerText': 'x = -13, y = 4, z = 15', 'score': true},
    ],
  },
  {
    'question': "Gauss Seidel method is also termed as a method of _______",
    'answers': [
      {'answerText': 'Iterations', 'score': false},
      {'answerText': 'Successive displacement', 'score': true},
      {'answerText': 'False positions', 'score': false},
    ],
  },
];

