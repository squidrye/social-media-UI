import 'package:flutter/material.dart';
import 'package:social_media_demo/DummyData/dummyData.dart';

class StoryCarousel extends StatelessWidget {
  const StoryCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 135,
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 135,
                    height: 170,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      child: Image.network(listData[0]['profilePhotos']![2],
                          fit: BoxFit.cover),
                    ),
                  ),
                  Positioned(
                    left:12,
                    top:2,
                    child: Container(height: 30, child: Text("Live",style: Theme.of(context).textTheme.headline1,)),
                  ),
                  Positioned(
                    right:12,
                    top:10,
                    child: Container(height: 30, child: Text("20.5K",style: Theme.of(context).textTheme.headline2,)),
                  ),
                  Positioned(
                    bottom: 15,
                      left:12,
                      right:20,
                      child: Text("Name",style: Theme.of(context).textTheme.headline1,)),
                  Positioned(
                    bottom: 1,
                      left:12,
                      right:20,
                      child: Text("Description long",style: Theme.of(context).textTheme.headline2,)),
                ],
              ),
            ],
          )),
    );
  }
}
