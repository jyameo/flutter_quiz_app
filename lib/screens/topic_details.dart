import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/models/models.dart';

import 'sharedUI/shared.dart';

class TopicDetailScreen extends StatelessWidget {
  final Topic topic;

  const TopicDetailScreen({Key key, this.topic}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        children: <Widget>[
          Hero(
              tag: topic.img,
              child: Image.asset(
                'assets/covers/${topic.img}',
                width: MediaQuery.of(context).size.width,
              )),
          Text(
            topic.title,
            style:
                TextStyle(height: 2, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          QuizListDisplay(topic: topic)
        ],
      ),
    );
  }
}
