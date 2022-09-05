import 'package:flutter/material.dart';
import 'constants/routes.dart';
import 'answer_handler.dart';

class ElectronicsQuizView extends StatefulWidget {
  const ElectronicsQuizView({Key? key}) : super(key: key);

  @override
  State<ElectronicsQuizView> createState() => _ElectronicsQuizViewState();
}

class _ElectronicsQuizViewState extends State<ElectronicsQuizView> {
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
    "Which number system has a base 16?",
    'answers': [
      {'answerText': 'Hexadecimal', 'score': true},
      {'answerText': 'Decimal', 'score': false},
      {'answerText': 'Octal', 'score': false},
    ],
  },
  {
    'question':
    "What is a digital-to-analog converter?",
    'answers': [
      {'answerText': 'It converts electrical power into mechanical power.', 'score': false},
      {'answerText': 'It takes the digital data from an audio CD and converts it to a useful form.', 'score': true},
      {'answerText': 'It stores digital data on the computer.', 'score': false},
    ],
  },
  {
    'question': "How many entries will be in the truth table of a 4-input NAND gate?",
    'answers': [
      {'answerText': '32', 'score': false},
      {'answerText': '8', 'score': false},
      {'answerText': '16', 'score': true},
    ],
  },
  {
    'question':
    "How many bits are needed to store one BCD digit?",
    'answers': [
      {'answerText': '2', 'score': false},
      {'answerText': '3', 'score': false},
      {'answerText': '4', 'score': true},
    ],
  },
  {
    'question':
    "Convert (312) base 8 into decimal.",
    'answers': [
      {'answerText': '202', 'score': true},
      {'answerText': '203', 'score': false},
      {'answerText': '204', 'score': false},
    ],
  },
  {
    'question': "A SCR (Silicon Controlled Rectifier) is a ______.",
    'answers': [
      {'answerText': "device with 3 junctions", 'score': false},
      {
        'answerText': "device with 2 junctions",
        'score': true
      },
      {
        'answerText': "device with 1 junction",
        'score': false
      },
    ],
  },
  {
    'question': "Which semiconductor device is not a current triggering device?",
    'answers': [
      {'answerText': 'TRIAC', 'score': false},
      {
        'answerText': 'MOSFET',
        'score': true
      },
      {
        'answerText': 'GTO',
        'score': false
      },
    ],
  },
  {
    'question': "Which of these sets of logic gates are known as universal gates?",
    'answers': [
      {'answerText': 'XOR, NAND, OR', 'score': false},
      {'answerText': 'NOR, NAND, XNOR', 'score': false},
      {'answerText': 'NOR, NAND', 'score': true},
    ],
  },
  {
    'question': "Calculate: 101001 + 010011",
    'answers': [
      {'answerText': '010100', 'score': false},
      {'answerText': '111100', 'score': true},
      {'answerText': '000111', 'score': false},
    ],
  },
  {
    'question': "Calculate: 101001 - 010110?",
    'answers': [
      {'answerText': '010011', 'score': true},
      {'answerText': '100110', 'score': false},
      {'answerText': '011001', 'score': false},
    ],
  },
];

