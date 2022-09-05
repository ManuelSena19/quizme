import 'package:flutter/material.dart';
import 'constants/routes.dart';
import 'answer_handler.dart';

class SystemAnalysisQuizView extends StatefulWidget {
  const SystemAnalysisQuizView({Key? key}) : super(key: key);

  @override
  State<SystemAnalysisQuizView> createState() => _SystemAnalysisQuizViewState();
}

class _SystemAnalysisQuizViewState extends State<SystemAnalysisQuizView> {
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
    "Which of the following is not one of three main advantages of a decision tree over a decision table?",
    'answers': [
      {'answerText': 'More correct as a communication tool', 'score': true},
      {'answerText': 'Sequential structure of decision tree branches ', 'score': false},
      {'answerText': 'Conditions and actions of decision trees are found on some branches ', 'score': false},
    ],
  },
  {
    'question':
    "Which choice is correct?",
    'answers': [
      {'answerText': 'Use structured English when not every condition is relevant to every action.', 'score': false},
      {'answerText': 'Use decision tables when communication to end users is important.', 'score': false},
      {'answerText': 'Use decision trees when the sequence of conditions and actions is critical.', 'score': true},
    ],
  },
  {
    'question': "If a process explodes to a child diagram:",
    'answers': [
      {'answerText': 'the process logic shows the order of execution for the child diagram processes.', 'score': true},
      {'answerText': 'the process logic is depicted using a decision tree, with child data flow appearing as the connecting lines on the tree.', 'score': false},
      {'answerText': 'process logic is not written.', 'score': false},
    ],
  },
  {
    'question':
    "Which of the following is not a business rule?",
    'answers': [
      {'answerText': 'Business conditions and actions', 'score': false},
      {'answerText': 'User ethics', 'score': true},
      {'answerText': 'Processing sequences', 'score': false},
    ],
  },
  {
    'question':
    "The rules for horizontal balancing are:",
    'answers': [
      {'answerText': 'All base elements on an output data flow must be on an input flow or included in the process logic', 'score': false},
      {'answerText': 'All derived elements on an output data flow must be on an input flow or included in the process logic', 'score': true},
      {'answerText': 'The input and output from a parent process must be present on the child diagram.', 'score': false},
    ],
  },
  {
    'question': "Which of the following is not a problem when creating decision tables?",
    'answers': [
      {'answerText': 'Impossible situations', 'score': false},
      {
        'answerText': 'Too many conditions',
        'score': true
      },
      {
        'answerText': 'Redundancy',
        'score': false
      },
    ],
  },
  {
    'question': "When applying the principles of horizontal balancing, base elements:",
    'answers': [
      {'answerText': 'must come from a data store', 'score': false},
      {
        'answerText': 'must be derived from process logic',
        'score': false
      },
      {
        'answerText': 'must be on an input',
        'score': true
      },
    ],
  },
  {
    'question': "In order to determine the human information requirements using a decision analysis strategy, what must the systems analyst determine?",
    'answers': [
      {'answerText': 'necessary data', 'score': false},
      {'answerText': 'objectives', 'score': true},
      {'answerText': 'data structure', 'score': false},
    ],
  },
  {
    'question': "A goal of producing process specifications is to:",
    'answers': [
      {'answerText': 'reduce process interactions', 'score': false},
      {'answerText': 'design computer input and output processes', 'score': false},
      {'answerText': 'validate the system design, including data flow diagrams and the data dictionary', 'score': true},
    ],
  },
  {
    'question': "Primitive process specifications are not produced for:",
    'answers': [
      {'answerText': 'processes for which pre-written code already exists', 'score': true},
      {'answerText': 'processes that use decision trees', 'score': false},
      {'answerText': 'processes that involve complex editing', 'score': false},
    ],
  },
];

