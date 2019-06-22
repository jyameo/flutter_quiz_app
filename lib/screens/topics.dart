import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/sharedUI/shared.dart';

class TopicScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('topics'), backgroundColor: Colors.purple),
      bottomNavigationBar: AppBottomNav(),
    );
  }
}
