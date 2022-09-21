import 'dart:math';

import 'package:flutter/material.dart';

class HeartInteraction extends StatefulWidget {
  var heartCount = Random().nextInt(1000);

  HeartInteraction({Key? key}) : super(key: key);

  @override
  State<HeartInteraction> createState() => _HeartInteractionState();
}

class _HeartInteractionState extends State<HeartInteraction> {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      IconButton(
        onPressed: () {
          setState(() {
            widget.heartCount++;
          });
        },
        icon: Icon(Icons.heart_broken),
      ),
      Text("${widget.heartCount}"),
    ]);
  }
}
