import 'package:flutter/material.dart';
import 'constants/routes.dart';
import 'answer_handler.dart';

class MobileAppsQuizView extends StatefulWidget {
  const MobileAppsQuizView({Key? key}) : super(key: key);

  @override
  State<MobileAppsQuizView> createState() => _MobileAppsQuizViewState();
}

class _MobileAppsQuizViewState extends State<MobileAppsQuizView> {
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
    "How is an activity killed in Android?",
    'answers': [
      {'answerText': 'finish()', 'score': false},
      {'answerText': 'finishActivity(int requestCode)', 'score': false},
      {'answerText': 'Both', 'score': true},
    ],
  },
  {
    'question':
    "How do you stop the services in android?",
    'answers': [
      {'answerText': 'stopService()', 'score': true},
      {'answerText': 'system.exit()', 'score': false},
      {'answerText': 'finish()', 'score': false},
    ],
  },
  {
    'question': "What is Android?",
    'answers': [
      {'answerText': 'an operating system', 'score': true},
      {'answerText': 'a web server', 'score': false},
      {'answerText': 'a database management system', 'score': false},
    ],
  },
  {
    'question':
    "Under which of the following Android is licensed?",
    'answers': [
      {'answerText': 'OSS', 'score': false},
      {'answerText': 'Sourceforge', 'score': false},
      {'answerText': 'Apache/MIT', 'score': true},
    ],
  },
  {
    'question':
    "For which of the following Android is mainly developed?",
    'answers': [
      {'answerText': 'Servers', 'score': false},
      {'answerText': 'Mobile devices', 'score': true},
      {'answerText': 'Laptops', 'score': false},
    ],
  },
  {
    'question': "Which of the following is the first mobile phone released that ran the Android OS?",
    'answers': [
      {'answerText': "HTC Hero", 'score': false},
      {
        'answerText': "Google gPhone",
        'score': false
      },
      {
        'answerText': "T - Mobile G1",
        'score': true
      },
    ],
  },
  {
    'question': "Which of the following virtual machine is used by the Android operating system?",
    'answers': [
      {'answerText': 'JVM Dalvik virtual machine', 'score': true},
      {
        'answerText': 'Simple virtual machine',
        'score': false
      },
      {
        'answerText': 'None of the above',
        'score': false
      },
    ],
  },
  {
    'question': "Android is based on which of the following language?",
    'answers': [
      {'answerText': 'Java', 'score': true},
      {'answerText': 'Kotlin', 'score': false},
      {'answerText': 'C++', 'score': false},
    ],
  },
  {
    'question': "APK stands for:",
    'answers': [
      {'answerText': 'Android Phone Kit', 'score': false},
      {'answerText': 'Android Page Kit', 'score': false},
      {'answerText': 'Android Package Kit', 'score': true},
    ],
  },
  {
    'question': "What does API stand for?",
    'answers': [
      {'answerText': 'Android Programming Interface', 'score': false},
      {'answerText': 'Application Programming Interface', 'score': true},
      {'answerText': 'Application Page Interface', 'score': false},
    ],
  },
];


