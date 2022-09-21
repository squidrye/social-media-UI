import 'package:flutter/material.dart';

import '../Widget/feedDiscover.dart';
import 'Reels/MainScreen.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        "Discover",
        style: Theme.of(context).textTheme.headline6,
      ),
      Row(children: [
        Expanded(
          child: Center(
            child: GestureDetector(
                child: Text("Posts",
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline))),
          ),
        ),
        Expanded(
          child: Center(
            child: GestureDetector(onTap: () {
              Navigator.push(context,MaterialPageRoute(builder: (ctx){
                return MainScreenReel();
              }));
            }, child: Text("Reels")),
          ),
        ),
      ]),
      SizedBox(width: double.infinity, child: FeedDiscover()),
    ]);
  }
}
