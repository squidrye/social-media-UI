import 'package:flutter/material.dart';
import 'package:social_media_demo/DummyData/dummyData.dart';
import'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../Widget/feedDiscover.dart';

class ProfilePageMain extends StatelessWidget {
  const ProfilePageMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.only(left: 12),
          margin: EdgeInsets.all(12),
          child: Text(
            "My Profile",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.start,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                children: [
                  Container(
                    width: 200,
                    padding: EdgeInsets.only(left: 12),
                    child: Text(
                      "Doyno Boriskov",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Container(
                      width: 200,
                      padding: EdgeInsets.only(left: 12),
                      child: Text(
                        "Entrepreneur",
                        textAlign: TextAlign.start,
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: CircleAvatar(
                radius: 36,
                foregroundImage: NetworkImage(
                  listData[0]['profilePhotos']![1],
                ),
              ),
            )
          ],
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 0, 10, 0),
            child: Text("101K \n Followers"),
          ),
          Text("101K \n Following"),
          Container(
            width: 220,
            margin: EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Follow"),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                  ),
                ),
                Icon(Icons.verified, size: 20),
              ],
            ),
          ),
        ]),
        Container(
          height: 400,
          child: GridView.builder(
              gridDelegate: SliverQuiltedGridDelegate(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 6,
                pattern: [

                  QuiltedGridTile(1, 1),
                  QuiltedGridTile(1, 1),
                  QuiltedGridTile(1, 2),
                ],
              ),
              itemCount: imageList.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      )),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    child: Image.network(imageList[index], fit:BoxFit.cover),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
