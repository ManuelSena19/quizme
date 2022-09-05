import 'package:flutter/material.dart';
import 'package:quizme_app_demo/answer_handler.dart';
import 'constants/routes.dart';

class DatabaseQuizView extends StatefulWidget {
  const DatabaseQuizView({Key? key}) : super(key: key);

  @override
  State<DatabaseQuizView> createState() => _DatabaseQuizViewState();
}

class _DatabaseQuizViewState extends State<DatabaseQuizView> {
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
    "A secondary key is which of the following?",
    'answers': [
      {'answerText': 'Non unique key', 'score': true},
      {'answerText': 'Primary key', 'score': false},
      {'answerText': 'Useful for de-normalization decisions', 'score': false},
    ],
  },
  {
    'question':
    "Which of the following are the types of sub-queries?",
    'answers': [
      {'answerText': 'Grouped sub-queries', 'score': false},
      {'answerText': 'Ordered sub-queries', 'score': false},
      {'answerText': 'Single row sub-queries', 'score': true},
    ],
  },
  {
    'question': "Which of the following clauses is mandatory in the use of a sub-query?",
    'answers': [
      {'answerText': 'SELECT', 'score': true},
      {'answerText': 'WHERE', 'score': false},
      {'answerText': 'GROUP BY', 'score': false},
    ],
  },
  {
    'question':
    "In the given scenarios, which one would appropriately justify the usage of sub-query?",
    'answers': [
      {'answerText': 'When we need to sum up values', 'score': false},
      {'answerText': 'When we need to convert character values into date or number values', 'score': false},
      {'answerText': 'When we need to select rows from a table with a condition that depends on the data from the same or different table.', 'score': true},
    ],
  },
  {
    'question':
    "Which of the following operators cannot be used in a sub-query?",
    'answers': [
      {'answerText': 'AND', 'score': true},
      {'answerText': '<>', 'score': false},
      {'answerText': '<', 'score': false},
    ],
  },
  {
    'question': "What is the best data type definition for Oracle when a field is alphanumeric and has a fixed length?",
    'answers': [
      {'answerText': 'VARCHAR2', 'score': false},
      {
        'answerText': 'CHAR',
        'score': true
      },
      {
        'answerText': 'LONG',
        'score': false
      },
    ],
  },
  {
    'question': "Which of the following is not a factor to consider when switching from small to large block size?",
    'answers': [
      {'answerText': 'The length of all of the fields in a table row.', 'score': false},
      {
        'answerText': 'The number of columns',
        'score': true
      },
      {
        'answerText': 'Random row access speed',
        'score': false
      },
    ],
  },
  {
    'question': "If a denormalization situation exists with a one-to-one binary relationship, which of the following is true?",
    'answers': [
      {'answerText': 'All fields are stored in one relation', 'score': true},
      {'answerText': 'All fields are stored in two relations.', 'score': false},
      {'answerText': 'All fields are stored in three relations', 'score': false},
    ],
  },
  {
    'question': "Which of the following is an advantage of partitioning",
    'answers': [
      {'answerText': 'Complexity', 'score': false},
      {'answerText': 'Security', 'score': true},
      {'answerText': 'Extra space', 'score': false},
    ],
  },
  {
    'question': "If no multivalued attributes exist in a relation, then the relation is in what normal form?",
    'answers': [
      {'answerText': 'First normal form', 'score': true},
      {'answerText': 'Second normal form', 'score': false},
      {'answerText': 'Third normal form', 'score': false},
    ],
  },
];

