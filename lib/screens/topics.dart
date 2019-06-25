import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/models/models.dart';
import 'package:flutter_quiz_app/services/services.dart';

import 'sharedUI/shared.dart';

class TopicScreen extends StatefulWidget {
  @override
  _TopicScreenState createState() => _TopicScreenState();
}

class _TopicScreenState extends State<TopicScreen> {
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
                backgroundColor: Colors.deepPurple,
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
