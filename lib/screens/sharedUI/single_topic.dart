import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/models/models.dart';
import 'package:flutter_quiz_app/screens/screens.dart';

class SingleTopicDisplay extends StatelessWidget {
  final Topic topic;

  const SingleTopicDisplay({Key key, this.topic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Hero(
          tag: topic.img,
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) =>
                        TopicDetailScreen(topic: topic)));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Image.asset('{assets/covers/$topic.img}',
                      fit: BoxFit.contain),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Text(
                            topic.title,
                            style: TextStyle(
                                height: 1.5, fontWeight: FontWeight.bold),
                            overflow: TextOverflow.fade,
                            softWrap: false,
                          ),
                        ),
                      )
                    ],
                  ),
                  TopicProgress(topic: topic)
                ],
              ),
            ),
          )),
    );
  }
}
