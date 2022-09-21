import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<types.Message> _messages = [];
  final _user = const types.User(id: '82091008-a484-4a89-ae75-a22bf8d6f3ac');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Row(children: [
          CircleAvatar(
            child: Icon(Icons.person),
          ),
          SizedBox(
            width: 10,
          ),
          Text("Joseph Tyler"),
        ]),
        actions: [
          IconButton(
              visualDensity: VisualDensity(horizontal: -2.0, vertical: -4.0),
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: Icon(Icons.call)),
          IconButton(
              visualDensity: VisualDensity(horizontal: -2.0, vertical: -4.0),
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: Icon(Icons.video_call)),
          IconButton(
              visualDensity: VisualDensity(horizontal: -2.0, vertical: -4.0),
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: Icon(Icons.arrow_drop_down_outlined)),
        ],
      ),
      body: Chat(
        messages: _messages,
        onSendPressed: _handleSendPressed,
        user: _user,
      ),
    );
  }

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  String randomString() {
    final random = Random.secure();
    final values = List<int>.generate(16, (i) => random.nextInt(255));
    return base64UrlEncode(values);
  }

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: randomString(),
      text: message.text,
    );

    _addMessage(textMessage);
  }
}
