import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/models/models.dart';

import 'shared.dart';

class TopicDrawer extends StatelessWidget {
  final List<Topic> topics;

  const TopicDrawer({Key key, this.topics}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int idx) {
            Topic topic = topics[idx];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 10, left: 10),
                  child: Text(
                    topic.title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70,
                    ),
                  ),
                ),
                QuizListDisplay(topic: topic)
              ],
            );
          },
          separatorBuilder: (BuildContext context, int idx) => Divider(),
          itemCount: topics.length),
    );
  }
}
