import 'package:flutter/material.dart';
import 'package:quizme_app_demo/answer_handler.dart';
import 'constants/routes.dart';

class AssemblyQuizView extends StatefulWidget {
  const AssemblyQuizView({Key? key}) : super(key: key);

  @override
  State<AssemblyQuizView> createState() => _AssemblyQuizViewState();
}

class _AssemblyQuizViewState extends State<AssemblyQuizView> {
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
        "A field which stands for operation code and specifies the particular operation is to be performed is called?",
    'answers': [
      {'answerText': 'Opcode', 'score': true},
      {'answerText': 'Oppcode', 'score': false},
      {'answerText': 'Oncode', 'score': false},
    ],
  },
  {
    'question':
        "The set of all instructions that make up a computer's machine language is called?",
    'answers': [
      {'answerText': 'Program set', 'score': false},
      {'answerText': 'Instruction set', 'score': true},
      {'answerText': 'Assembly set', 'score': false},
    ],
  },
  {
    'question': "What translates assembly code to machine code?",
    'answers': [
      {'answerText': 'Compiler', 'score': false},
      {'answerText': 'Assembler', 'score': true},
      {'answerText': 'Translator', 'score': false},
    ],
  },
  {
    'question':
        "What combines one or more object files into a single executable file, library file, or another object file?",
    'answers': [
      {'answerText': 'Loader', 'score': false},
      {'answerText': 'Assembler', 'score': false},
      {'answerText': 'Linker', 'score': true},
    ],
  },
  {
    'question':
        "A very fast type of RAM that stores information that is frequently used by the computer is called?",
    'answers': [
      {'answerText': 'ROM', 'score': false},
      {'answerText': 'Cache', 'score': true},
      {'answerText': 'Register', 'score': false},
    ],
  },
  {
    'question': "Which of the following is not true about RAM?",
    'answers': [
      {'answerText': 'RAM is volatile', 'score': false},
      {
        'answerText': 'RAM can be read from and written onto easily',
        'score': false
      },
      {
        'answerText': 'RAM can store data even after the pc is turned off',
        'score': true
      },
    ],
  },
  {
    'question': "What is the function of the ALU?",
    'answers': [
      {'answerText': 'It stores data', 'score': false},
      {
        'answerText': 'It preforms arithmetic and logic operations',
        'score': true
      },
      {
        'answerText': 'It manages the other components of the computer',
        'score': false
      },
    ],
  },
  {
    'question': "A bit is the _________?",
    'answers': [
      {'answerText': 'fundamental unit of storage.', 'score': true},
      {'answerText': 'smallest unit of processing', 'score': false},
      {'answerText': 'main part of the motherboard', 'score': false},
    ],
  },
  {
    'question': "Convert FAD8 to binary.",
    'answers': [
      {'answerText': '1111 1010 1101 1000', 'score': true},
      {'answerText': '1111 1010 1101 1001', 'score': false},
      {'answerText': '1111 1010 1111 1000', 'score': false},
    ],
  },
  {
    'question': "Convert 1000 1100 1101 0001 to hexadecimal.",
    'answers': [
      {'answerText': '8CD2', 'score': false},
      {'answerText': '8CB3', 'score': false},
      {'answerText': '8CD1', 'score': true},
    ],
  },
];
