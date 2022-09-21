import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../DummyData/dummyData.dart';
class FeedDiscover extends  StatelessWidget {
  const FeedDiscover({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverQuiltedGridDelegate(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 12,
        pattern: [
          QuiltedGridTile(2, 2),
          QuiltedGridTile(1, 1),
          QuiltedGridTile(1, 1),
          QuiltedGridTile(1, 2),
        ],
      ),
      itemCount: imageList.length,
      itemBuilder:(context, index){
            return Container(
              decoration: BoxDecoration(
                color:Colors.transparent,
                  borderRadius: BorderRadius.all(
                      Radius.circular(15),
                  )
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                    Radius.circular(15)),
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: imageList[index],fit: BoxFit.cover,
                ),
              ),
            );
          }
    );
  }
}
