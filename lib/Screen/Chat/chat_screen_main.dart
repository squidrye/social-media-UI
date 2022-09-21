import 'package:flutter/material.dart';

import '../../DummyData/dummyData.dart';
import 'chat_screen.dart';

class ChatScreenHome extends StatelessWidget {
  const ChatScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        width: double.infinity,
        padding: EdgeInsets.only(left: 12),
        margin: EdgeInsets.all(12),
        child: Text(
          "Messages",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.start,
        ),
      ),
      Container(
        width: 380,
        height: 512,
        child: Card(
          child: ListView(
            padding: EdgeInsets.all(2),
            children: [
              ListTile(
                  leading: CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                  title: Text("Joseph Tyler"),
                  subtitle: Text("Hey! meet me by 4pm "),
                  trailing: Text("1 hr ago"),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ChatScreen();
                    }));
                  }),
              ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.person),
                ),
                title: Text("Joseph Tyler"),
                subtitle: Text("Hey! meet me by 4pm "),
                trailing: Text("1 hr ago"),
              ),
              ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.person),
                ),
                title: Text("Joseph Tyler"),
                subtitle: Text("Hey! meet me by 4pm "),
                trailing: Text("1 hr ago"),
              ),
              ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.person),
                ),
                title: Text("Joseph Tyler"),
                subtitle: Text("Hey! meet me by 4pm "),
                trailing: Text("1 hr ago"),
              ),
              ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.person),
                ),
                title: Text("Joseph Tyler"),
                subtitle: Text("Hey! meet me by 4pm "),
                trailing: Text("1 hr ago"),
              ),
              ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.person),
                ),
                title: Text("Joseph Tyler"),
                subtitle: Text("Hey! meet me by 4pm "),
                trailing: Text("1 hr ago"),
              ),
              ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.person),
                ),
                title: Text("Joseph Tyler"),
                subtitle: Text("Hey! meet me by 4pm "),
                trailing: Text("1 hr ago"),
              ),
              ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.person),
                ),
                title: Text("Joseph Tyler"),
                subtitle: Text("Hey! meet me by 4pm "),
                trailing: Text("1 hr ago"),
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
