import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/models/models.dart';
import 'package:provider/provider.dart';

import 'shared.dart';

class TopicProgress extends StatelessWidget {
  final Topic topic;

  const TopicProgress({Key key, this.topic}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Report report = Provider.of<Report>(context);
    return Row(
      children: <Widget>[
        _progressCount(report, topic),
        Expanded(
          child: AnimatedProgressBar(
              value: _calculateProgress(topic, report), height: 8),
        )
      ],
    );
  }

  _progressCount(Report report, Topic topic) {
    if (report != null && topic != null) {
      return Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Text(
            '${report.topics[topic.id]?.length ?? 0} / ${topic?.quizzes?.length ?? 0}',
            style: TextStyle(fontSize: 10, color: Colors.grey)),
      );
    } else {
      return Container();
    }
  }

  double _calculateProgress(Topic topic, Report report) {
    try {
      int totalQuizzes = topic.quizzes.length;
      int completedQuizzes = report.topics[topic.id].length;
      return completedQuizzes / totalQuizzes;
    } catch (error) {
      return 0.0;
    }
  }
}
