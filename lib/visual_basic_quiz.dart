import 'package:flutter/material.dart';
import 'answer_handler.dart';
import 'constants/routes.dart';

class VisualQuizView extends StatefulWidget {
  const VisualQuizView({Key? key}) : super(key: key);

  @override
  State<VisualQuizView> createState() => _VisualQuizViewState();
}

class _VisualQuizViewState extends State<VisualQuizView> {
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
    "When the user clicks a button, _____ is triggered.",
    'answers': [
      {'answerText': 'an event', 'score': true},
      {'answerText': 'a method', 'score': false},
      {'answerText': 'a property', 'score': false},
    ],
  },
  {
    'question':
    "What property of controls tells the order they receive the focus when the tab key is pressed during run time?",
    'answers': [
      {'answerText': 'Control order', 'score': false},
      {'answerText': 'Focus order', 'score': false},
      {'answerText': 'Tab index', 'score': true},
    ],
  },
  {
    'question': "Sizing handles make it very easy to resize virtually any control when developing apps with Visual Basic. When working in the Form Designer, how are these sizing handles displayed?",
    'answers': [
      {'answerText': 'A rectangle with 4 arrows, one in each corner, around your control', 'score': false},
      {'answerText': 'A 3D outline around your control', 'score': false},
      {'answerText': 'A rectangle with small squares around your control', 'score': true},
    ],
  },
  {
    'question':
    "The Properties window plays an important role in the development of Visual Basic apps. It is mainly used to?",
    'answers': [
      {'answerText': 'change how objects look and feel', 'score': true},
      {'answerText': 'open programs stored on a hard drive', 'score': false},
      {'answerText': 'set program related options like Program Name, Location etc', 'score': false},
    ],
  },
  {
    'question':
    "Which of the properties in a control's list of properties is used to give the control a meaningful name?",
    'answers': [
      {'answerText': 'ContextMenu', 'score': false},
      {'answerText': 'ControlName', 'score': false},
      {'answerText': 'Name', 'score': true},
    ],
  },
  {
    'question': "What is a pseudocode?",
    'answers': [
      {'answerText': 'data that has been encoded for security', 'score': false},
      {
        'answerText': 'a description of an algorithm similar to a computer language',
        'score': true
      },
      {
        'answerText': 'a program that does not work',
        'score': false
      },
    ],
  },
  {
    'question': "What is the correct syntax for declaring and assigning the value of 100 to an integer value called numPeople?",
    'answers': [
      {'answerText': 'Dim numPeople As Integer = 100', 'score': true},
      {
        'answerText': 'Dim numPeople = Integer(100)',
        'score': false
      },
      {
        'answerText': 'numPeople = 100',
        'score': false
      },
    ],
  },
  {
    'question': "What value is returned by InputBox?",
    'answers': [
      {'answerText': 'String', 'score': true},
      {'answerText': 'Character', 'score': false},
      {'answerText': 'Integer', 'score': false},
    ],
  },
  {
    'question': "A variable declared inside an event procedure is said to have local scope.",
    'answers': [
      {'answerText': 'True', 'score': true},
      {'answerText': 'False', 'score': false},
      {'answerText': 'Both', 'score': false},
    ],
  },
  {
    'question': "What value will be assigned to the numeric variable x when the following statement is executed? x = 2 + 3 * 4",
    'answers': [
      {'answerText': '20', 'score': false},
      {'answerText': '234', 'score': false},
      {'answerText': '14', 'score': true},
    ],
  },
];

