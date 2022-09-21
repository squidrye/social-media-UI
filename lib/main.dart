import 'package:flutter/material.dart';
import 'package:social_media_demo/Screen/baseScreen.dart';
import 'package:social_media_demo/Screen/drawerScreen.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Screen/ImagePicker/mainScreen.dart';

void main() {
  runApp(
    MaterialApp(
      routes: {
        '/':(ctx){
          return HomePage();
        },
        MainScreen.routeName:(ctx){
          return MainScreen(title: 'Image Picker');
        }

      },
      theme: ThemeData(
        textTheme: TextTheme(
          headline6: GoogleFonts.montserrat(),
          headline1: GoogleFonts.montserrat(color:Colors.white,fontSize: 20,fontWeight: FontWeight.bold),
          headline2: GoogleFonts.montserrat(color:Colors.white,fontSize: 12,fontWeight: FontWeight.bold),
          headline3: GoogleFonts.montserrat(fontSize: 12,)
        ),
      ),
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: const <Widget>[
      DrawerScreen(),
      BaseScreen(),
    ]);
  }
}
