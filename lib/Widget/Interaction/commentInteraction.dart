import 'package:flutter/material.dart';

class CommentInteraction extends StatefulWidget {
  const CommentInteraction({Key? key}) : super(key: key);

  @override
  State<CommentInteraction> createState() => _CommentInteractionState();
}

class _CommentInteractionState extends State<CommentInteraction> {
  @override
  Widget build(BuildContext context) {
      return Row(children: [
        IconButton(
          onPressed: () {

          },
          icon: Icon(Icons.comment),
        ),
        Text("67"),
      ]);
  }
}
