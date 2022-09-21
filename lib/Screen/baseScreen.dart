import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:social_media_demo/Screen/discoverScreen.dart';
import 'Chat/chat_screen_main.dart';
import 'ImagePicker/mainScreen.dart';
import 'ProfileScreen/profile_page_main.dart';
import 'homeScreen.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _selectedIndex = 0;
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;
  List<Widget> screens = [
    HomeScreen(),
    DiscoverScreen(),
    MainScreen(title:'ImagePicker'),
    ChatScreenHome(),
    ProfilePageMain(),
  ];

  //methods
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor),
      duration: Duration(milliseconds: 250),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(isDrawerOpen?40:(0.0)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(isDrawerOpen?40:0),
        child: Scaffold(
          backgroundColor: Colors.grey[300],
          body: SafeArea(
            child: SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Column(
                children: [
                  //1st Row for drawer icon and Search bar
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                if (!isDrawerOpen) {
                                  xOffset = 230;
                                  yOffset = 170;
                                  scaleFactor = 0.6;
                                } else {
                                  xOffset = 0;
                                  yOffset = 0;
                                  scaleFactor = 1;
                                }
                                isDrawerOpen = !isDrawerOpen;
                              });
                            },
                            icon: Icon(
                                isDrawerOpen ? Icons.arrow_back : Icons.menu)),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          width: 300,
                          child: SearchBar(),
                          // margin:EdgeInsets.only(left:110),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  // 2nd Row for carousel
                  screens[_selectedIndex],
                  // /3rd Row and rest for list view builder which will build custom post widgets
                ],
              ),
            ),
          ),
          bottomNavigationBar: CurvedNavigationBar(
            items: const <Widget>[
              Icon(Icons.home),
              Icon(Icons.explore),
              Icon(Icons.add),
              Icon(Icons.chat_bubble),
              Icon(Icons.person),
            ],
            onTap: onIconTapped,
            backgroundColor: Colors.grey[300]!,
            animationDuration: const Duration(milliseconds: 200),
            animationCurve: Curves.bounceInOut,
            height: 60,
          ),
        ),
      ),
    );
  }

  void onIconTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}


class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(children: [Icon(Icons.search), Text("Search...")]);
  }
}
