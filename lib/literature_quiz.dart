import 'package:flutter/material.dart';
import 'constants/routes.dart';
import 'answer_handler.dart';

class LiteratureQuizView extends StatefulWidget {
  const LiteratureQuizView({Key? key}) : super(key: key);

  @override
  State<LiteratureQuizView> createState() => _LiteratureQuizViewState();
}

class _LiteratureQuizViewState extends State<LiteratureQuizView> {
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
    "In literary works, ______ is used to stand for or represent something else",
    'answers': [
      {'answerText': 'Symbolism', 'score': true},
      {'answerText': 'Imagery', 'score': false},
      {'answerText': 'Culture', 'score': false},
    ],
  },
  {
    'question':
    "_____ represents a series of events that comprise the whole story that is told in a play.",
    'answers': [
      {'answerText': 'Theme', 'score': false},
      {'answerText': 'Narration', 'score': false},
      {'answerText': 'Plot', 'score': true},
    ],
  },
  {
    'question': "______ is a dramatic correction in which a character speaks to himself or makes a comment in the presence of another, yet assumed he/she does not hear.",
    'answers': [
      {'answerText': 'Soliloquy', 'score': false},
      {'answerText': 'Aside', 'score': true},
      {'answerText': 'Monologue', 'score': false},
    ],
  },
  {
    'question':
    "The various movements in plays function to _____ the audience",
    'answers': [
      {'answerText': 'move the emotion of', 'score': false},
      {'answerText': 'warn', 'score': false},
      {'answerText': 'project the new setting to', 'score': true},
    ],
  },
  {
    'question':
    "The character remarked, 'Yes! A bola bird, a stinking fish.' Which literary device is this?",
    'answers': [
      {'answerText': 'Metaphor', 'score': true},
      {'answerText': 'Oxymoron', 'score': false},
      {'answerText': 'Hyperbole', 'score': false},
    ],
  },
  {
    'question': "_____ is a language in literature that appeals to the senses.",
    'answers': [
      {'answerText': "Imagery", 'score': true},
      {
        'answerText': "Mood",
        'score': false
      },
      {
        'answerText': "Symbolism",
        'score': false
      },
    ],
  },
  {
    'question': "In a dramatic piece, _____ is the internal or external struggle between forces of interest that creates tension.",
    'answers': [
      {'answerText': 'plot', 'score': false},
      {
        'answerText': 'suspense',
        'score': false
      },
      {
        'answerText': 'conflict',
        'score': true
      },
    ],
  },
  {
    'question': "'I shall not give you red light to fantasy that there will be amber.' What literary device is this?",
    'answers': [
      {'answerText': 'metaphor', 'score': false},
      {'answerText': 'symbolism', 'score': true},
      {'answerText': 'hyperbole', 'score': false},
    ],
  },
  {
    'question': "The _____ character is usually stable and is said to be static and retains essentially the same outlook, attitude and value.",
    'answers': [
      {'answerText': 'stale', 'score': false},
      {'answerText': 'flat', 'score': true},
      {'answerText': 'dynamic', 'score': false},
    ],
  },
  {
    'question': "_____ is a statement in which there is an apparent contradiction which is totally true.",
    'answers': [
      {'answerText': 'irony', 'score': false},
      {'answerText': 'antithesis', 'score': false},
      {'answerText': 'paradox', 'score': true},
    ],
  },
];

