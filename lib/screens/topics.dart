import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/models/models.dart';
import 'package:flutter_quiz_app/services/services.dart';

import 'sharedUI/shared.dart';

class TopicScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Global.topicsRef.getData(),
        builder: (context, AsyncSnapshot snap) {
          if (snap.hasData) {
            List<Topic> topics = snap.data;
            return Scaffold(
              appBar: AppBar(
                title: Text('Topics'),
                backgroundColor: Colors.purple,
              ),
              drawer: TopicDrawer(topics: topics),
              body: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                primary: false,
                padding: const EdgeInsets.all(20.0),
                children: topics
                    .map((topic) => SingleTopicDisplay(topic: topic))
                    .toList(),
              ),
            );
          } else {
            return LoadingScreen();
          }
        });
  }
}

class TopicDrawer extends StatelessWidget {
  final List<Topic> topics;
//TODO
  const TopicDrawer({Key key, this.topics}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class TopicProgress extends StatelessWidget {
  //TODO
  final Topic topic;

  const TopicProgress({Key key, this.topic}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class QuizBadge extends StatelessWidget {
  // TODO
  final Topic topic;
  final String id;

  const QuizBadge({Key key, this.topic, this.id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
