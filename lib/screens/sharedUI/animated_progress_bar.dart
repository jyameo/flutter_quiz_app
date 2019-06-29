import 'package:flutter/material.dart';

class AnimatedProgressBar extends StatelessWidget {
  final double value;
  final double height;

  const AnimatedProgressBar({Key key, @required this.value, this.height = 12})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints box) {
        return Container(
          padding: EdgeInsets.all(10),
          width: box.maxWidth,
          child: Stack(
            children: <Widget>[
              Container(
                height: height,
                decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor,
                    borderRadius: BorderRadius.all(Radius.circular(height))),
              ),
              AnimatedContainer(
                  duration: Duration(milliseconds: 800),
                  curve: Curves.easeOutCubic,
                  height: height,
                  width: box.maxWidth * _floor(value),
                  decoration: BoxDecoration(
                      color: _colorGen(value),
                      borderRadius: BorderRadius.all(Radius.circular(height))))
            ],
          ),
        );
      },
    );
  }

  _floor(double value, [min = 0.0]) {
    return value.sign <= min ? min : value;
  }

  _colorGen(double value) {
    int rgb = (value * 255).toInt();
    return Colors.deepOrange.withGreen(rgb).withRed(255 - rgb);
  }
}
