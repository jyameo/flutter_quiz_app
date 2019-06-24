import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/models/models.dart';
import 'package:flutter_quiz_app/services/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'sharedUI/shared.dart';

class TopicScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Global.topicsRef.getData(),
        builder: (context, AsyncSnapshot snap) {
          if (snap.hasData) {
            List<Topic> topics = snap.data;
//            print(topics);
            return Scaffold(
              appBar: AppBar(
                title: Text('topics'),
                backgroundColor: Colors.purple,
                actions: <Widget>[
                  IconButton(
                      icon: Icon(FontAwesomeIcons.userCircle,
                          color: Colors.pink[200]),
                      onPressed: () =>
                          Navigator.pushNamed(context, '/profile')),
                ],
              ),
              drawer: TopicDrawer(topics: topics),
              body: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                primary: false,
                padding: const EdgeInsets.all(20.0),
//                children:
//                    topics.map((topic) => TopicView(topic: topic)).toList(),
              ),
            );
          } else {
            return LoadingScreen();
          }
        });
  }

  TopicDrawer({List<Topic> topics}) {}

  TopicView({Topic topic}) {}
}
