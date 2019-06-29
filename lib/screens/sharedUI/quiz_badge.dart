import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/models/models.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class QuizBadge extends StatelessWidget {
  final Topic topic;
  final String quizId;

  const QuizBadge({Key key, this.topic, this.quizId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Report report = Provider.of<Report>(context);
    if (report != null) {
      List completed = report.topics[topic.id];
      if (completed != null && completed.contains(quizId)) {
        return Icon(
          FontAwesomeIcons.checkDouble,
          color: Colors.green,
        );
      } else {
        return Icon(
          FontAwesomeIcons.solidCircle,
          color: Colors.grey,
        );
      }
    } else {
      return Icon(FontAwesomeIcons.circle, color: Colors.grey);
    }
  }
}
