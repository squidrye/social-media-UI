import 'package:flutter/material.dart';

class OptionsScreen extends StatelessWidget {
  const OptionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(),
        Row(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin:EdgeInsets.only(left:0),
                  child: Row(
                    children: [
                      Container(

                        margin:EdgeInsets.only(left:0),
                        child: CircleAvatar(
                            child: Icon(Icons.person, size: 24), radius: 16),
                      ),
                      Text('flutter_deva',
                      style: TextStyle(color: Colors.white, fontSize: 18),),
                      SizedBox(width: 10),
                      Icon(Icons.verified, size: 24),
                      SizedBox(width: 6),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Follow",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ))
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  margin:EdgeInsets.only(left:15),
                  child: Text('Flutter is beautiful and fast 💙❤💛 ..',
                    style: TextStyle(color: Colors.white, fontSize: 18),),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(
                      Icons.music_note,
                      size: 15,
                    ),
                    Text('Original Audio - some music track--',
                      style: TextStyle(color: Colors.white, fontSize: 18),),
                  ],
                ),
              ],
            ),
            SizedBox(width: 50,),
            Column(
              children: [
                Icon(Icons.favorite_outline),
                Text('601k'),
                SizedBox(height: 20),
                Icon(Icons.comment_rounded),
                Text('1123'),
                SizedBox(height: 20),
                Transform(
                  transform: Matrix4.rotationZ(5.8),
                  child: Icon(Icons.send),
                ),
                SizedBox(height: 50),
                Icon(Icons.more_vert),
              ],
            )
          ],
        ),
      ],
    );
  }
}
