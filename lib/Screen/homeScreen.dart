import 'package:flutter/material.dart';

import '../DummyData/dummyData.dart';
import '../Widget/feedCards.dart';
import '../Widget/storyCarousel.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                12,
              ),
              color: Colors.grey[300]),
          width: double.infinity,
          padding: EdgeInsets.all(12),
          child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                StoryCarousel(),
                StoryCarousel(),
                StoryCarousel(),
                StoryCarousel(),
                StoryCarousel(),
              ])),
        ),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: listData.length,
          itemBuilder: (ctx, index) {
            return FeedCards(
                profileImages: listData[index]['profilePhotos']
                as List<String>,
                postImages:
                listData[index]['postPhotos'] as List<String>);
          },
        ),
      ],
    );
  }
}