import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;
  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 8) {
      resultText = 'You are Awesome and innocent!!!';
    } else if (resultScore <= 12) {
      resultText = 'Pretty Likeable!!!';
    } else if (resultScore <= 16) {
      resultText = 'You are......Strange!!!';
    } else {
      resultText = 'You are so bad!!!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
            onPressed: resetHandler,
           
            child: Text('Restart Quiz'))
          // FlatButton(
          //   onPressed: resetHandler,
          //   textColor: Colors.blue,
          //   child: Text('Restart Quiz!!!'),
          // )
        ],
      ),
    );
  }
}
