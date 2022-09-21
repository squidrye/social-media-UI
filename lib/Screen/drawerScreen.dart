import 'package:flutter/material.dart';
import 'package:social_media_demo/Configurations/configuration.dart';

import '../DummyData/dummyData.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  List<Map> drawerItems = [
    {'icon': Icons.share, 'title': 'Share'},
    {'icon': Icons.mail, 'title': 'Mail'},
    {'icon': Icons.add, 'title': 'Invite'},
    {'icon': Icons.favorite, 'title': 'Favorites'},
    {'icon': Icons.mail, 'title': 'Messages'},
    {'icon': Icons.supervised_user_circle, 'title': 'Profile'},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        width: double.infinity,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: primaryGreen,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 36,
                      foregroundImage: NetworkImage(
                        listData[0]['profilePhotos']![1],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Miroslava Savitskaya',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        SizedBox(height: 10,),
                        Text('Active Status',
                            style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold,fontSize: 18))
                      ],
                    )
                  ],
                ),
              ),
              Column(
                children: drawerItems
                    .map((element) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(
                                element['icon'],
                                color: Colors.white,
                                size: 30,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(element['title'],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20))
                            ],
                          ),
                        ))
                    .toList(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Settings',
                      style: TextStyle(fontSize: 18,
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 2,
                      height: 20,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Log out',
                      style: TextStyle(fontSize: 18,
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
