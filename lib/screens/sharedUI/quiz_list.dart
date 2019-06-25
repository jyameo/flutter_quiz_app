import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/models/models.dart';
import 'package:flutter_quiz_app/screens/screens.dart';

class QuizListDisplay extends StatelessWidget {
  final Topic topic;

  const QuizListDisplay({Key key, this.topic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: topic.quizzes.map((quiz) {
      return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        elevation: 4,
        margin: EdgeInsets.all(4),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => QuizScreen(quizId: quiz.id),
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.all(8),
            child: ListTile(
              title: Text(
                quiz.title,
                style: Theme.of(context).textTheme.title,
              ),
              subtitle: Text(
                quiz.description,
                overflow: TextOverflow.fade,
                style: Theme.of(context).textTheme.subhead,
              ),
//              leading: QuizBadge(topic: topic, quizId: quiz.id),
            ),
          ),
        ),
      );
    }).toList());
  }
}
