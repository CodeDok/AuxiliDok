import 'package:flutter/material.dart';

class LevelIndicator extends StatelessWidget {
  double fraction;
  double size;
  LevelIndicator({
    this.fraction,
    this.size
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1.0),
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: <Widget>[
          FractionallySizedBox(
            heightFactor: 1 - fraction,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: fraction <= 0.2 ? BorderRadius.all(Radius.circular(10)) : BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 0.5),
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),
          )
        ],
      ),
    );
  }
}