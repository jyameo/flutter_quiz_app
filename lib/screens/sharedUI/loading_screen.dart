import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Container(
        width: 250,
        height: 250,
        child: CircularProgressIndicator(),
      )),
    );
  }
}
