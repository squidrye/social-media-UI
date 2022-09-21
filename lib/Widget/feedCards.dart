import 'package:flutter/material.dart';

import 'Interaction/commentInteraction.dart';
import 'Interaction/heartInteraction.dart';

class FeedCards extends StatelessWidget {
  final List<String> profileImages;
  final List<String> postImages;

  const FeedCards({
    Key? key,
    required this.profileImages,
    required this.postImages,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.white70, width: 1),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    child: CircleAvatar(
                      foregroundImage: NetworkImage(
                        profileImages[1],
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 200,
                        margin: EdgeInsets.only(left: 8),
                        child: Text(
                          textAlign: TextAlign.left,
                          "Name",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      Container(
                        width: 200,
                        margin: EdgeInsets.only(left: 8),
                        child: Text(
                          textAlign: TextAlign.left,
                          "A week ago",
                          style: Theme.of(context).textTheme.headline3,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ), // row for profile and name
            if (postImages.isNotEmpty)
              Row(children: [
                postImages.length > 2
                    ? Row(
                        children: [
                          Container(
                            margin: EdgeInsets.all(8),
                            height: 200,
                            width: 250,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.network(
                                  postImages[0],
                                  fit: BoxFit.cover,
                                )),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 8),
                                height: 95,
                                width: 110,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Image.network(
                                      postImages[1],
                                      fit: BoxFit.cover,
                                    )),
                              ),
                              Container(
                                height: 95,
                                width: 110,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Image.network(
                                      postImages[2],
                                      fit: BoxFit.cover,
                                    )),
                              ),
                            ],
                          )
                        ],
                      )
                    : Container(
                        height: 300,
                        width: 360,
                        margin: EdgeInsets.all(12),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.network(
                              postImages[0],
                              fit: BoxFit.cover,
                            )),
                      )
              ]), // row for image collab
            Padding(
              padding: EdgeInsets.all(12),
              child: Column(children: [
                Container(
                  width: double.infinity,
                  child: Text(
                    "A post caption will come",
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  style: Theme.of(context).textTheme.headline6,
                  "A post description will go here A post description will go here A post description will go here A post description will go here A post description will go here A post description will go here",
                )
              ]),
            ), // row for title and description
            Row(children: [
              HeartInteraction(),
              CommentInteraction(),
            ]), // Row for interaction
          ],
        ),
      ),
    );
  }
}
