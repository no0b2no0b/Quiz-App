

import 'package:flutter/material.dart';
// import './question.dart';
// import './answer.dart';
import './quiz.dart';
import './result.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';


Future<void> main() async {
  await Firebase.initializeApp(
  // options: DefaultFirebaseOptions.currentPlatform,
);
  // await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp(); 
  final _questions = const [
    {
      'questionText': 'What\'s your favourite colour ?',
      'answers': [
        {'text': 'Black', 'score': 5},
        {'text': 'Red', 'score': 6},
        {'text': 'Green', 'score': 8},
        {'text': 'White', 'score': 9}
      ],
    },

    {
      'questionText': 'What is your name ?',
      'answers': [
        {'text': 'Ajay', 'score': 2},
        {'text': 'Himanshu', 'score': 2},
        {'text': 'Mangal', 'score': 3},
        {'text': 'Bablu', 'score': 2}
      ],
    },

    {
      'questionText': 'Who\'s your favourite instructor ?',
      'answers': [
        {'text': 'John', 'score': 1},
        {'text': 'Riya', 'score': 1},
        {'text': 'Pablo', 'score': 1},
        {'text': 'Max', 'score': 1}
      ],
    },
    // 'What is your name ?'
  ];
  var _questionIndex = 0;
  var _totalScore = 0;
  
  
  void _resetQuiz(){
    setState(() {
    _questionIndex = 0;
    _totalScore = 0;      
    });
  }

  void _answerQuestion(int score) {
    // var aBool = true;
    // aBool = false;
    _totalScore = _totalScore + score ;
    setState(
      () {
        _questionIndex = _questionIndex + 1;
      },
    );
    // print('Button Clicked!');
    print(_questionIndex);

    if (_questionIndex < _questions.length) {
      print('We have more questions!!');
    }
  }

  @override
  Widget build(BuildContext context) {
    // const questions = [
    // {
    //   'questionText'  : 'What\'s your favourite colour ?',
    //   'answers' : ['Black','Red' , ' Green' , 'White'],
    // },

    // {
    //   'questionText'  : 'What is your name ?',
    //   'answers' : ['Ajay','Himanshu' , 'Mangal' , 'Bablu'],
    // },

    // {
    //   'questionText'  : 'Who\'s your favourite instructor ?',
    //   'answers' : ['Bond','Riya' , ' John' , 'Max'],
    // },
    //   // 'What is your name ?'
    //  ];

// var dummy = const ['Hello'];
// dummy.add('John');
// print(dummy);

// dummy = [];

    //  questions = [];   This doesnot work if questions is a constant.

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First app'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            // ? Column(
            // children: [
            //   // Text(
            //   //   questions.elementAt(0)
            //   //   ),
            //   Question(
            //     // questions[1]
            //     questions[_questionIndex]['questionText'] as String,
            //   ),

            //   ...(questions[_questionIndex]['answers'] as List<String>)
            //       .map((answer) {
            //     return Answer(_answerQuestion, answer);
            //   }).toList()

            //   // Answer(_answerQuestion),

            //   // RaisedButton(
            //   //   child: Text('Answer 1'),
            //   //   onPressed: _answerQuestion,
            //   // ),

            //   //we use answer.dart file here ...So in that we have a Answer() function
            //   //on the place of Raised Button..

            //   // Answer(_answerQuestion),

            //   // RaisedButton(
            //   //   child: Text('Answer 2'),
            //   //   onPressed: () => print('ANswer 2 choosen!!'),
            //   // ),
            //   // Answer(_answerQuestion),

            //   // RaisedButton(
            //   //   child: Text('Answer 3'),
            //   //   onPressed: () {
            //   //     //********** *
            //   //     print('Answer 3 Choosen!!!');
            //   //   },
            //   // )
            // ],)
            : Result(_totalScore , _resetQuiz),
      ),
    );
  }
}
