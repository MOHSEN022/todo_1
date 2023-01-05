import 'package:flutter/material.dart';

class MyTheme {
  static const Color lightBG = Color.fromRGBO(223, 236, 219, 1.0);
  static const Color allBlue = Color.fromRGBO(93, 156, 236, 1.0);
  static const Color allGreen = Color.fromRGBO(97, 231, 87, 1.0);
  static const Color allRed = Color.fromRGBO(236, 75, 75, 1.0);
  static const Color allGrey = Color.fromRGBO(200, 201, 203, 1.0);
  static const Color allWhite = Colors.white;
  static const Color allBlack = Colors.black;

  static final lightTheme = ThemeData(
    textTheme: const TextTheme(
      headline1: TextStyle(color: allBlack,fontWeight: FontWeight.bold,fontSize: 24),
      headline2: TextStyle(color: allBlack,fontWeight: FontWeight.bold,fontSize: 20),
      headline3: TextStyle(color: allBlack,fontWeight: FontWeight.normal,fontSize: 18),
      headline4: TextStyle(color: allBlue,fontWeight: FontWeight.bold,fontSize: 18),
    ),
    appBarTheme: AppBarTheme(color: allBlue,elevation: 0 ,),

    scaffoldBackgroundColor: lightBG,
    bottomSheetTheme: const BottomSheetThemeData(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(12), topLeft: Radius.circular(12)))),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: Colors.transparent,
      selectedIconTheme: IconThemeData(color: MyTheme.allBlue, size: 36),
      unselectedIconTheme: IconThemeData(color: MyTheme.allGrey, size: 24),
      showUnselectedLabels: false,
      showSelectedLabels: false,
    ),

  );
  static final darkTheme = ThemeData(
    textTheme: const TextTheme(
      headline1: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 24),
      headline2: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 20),
      headline3: TextStyle(color: Colors.green,fontWeight: FontWeight.normal,fontSize: 18),
      headline4: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 18),
    ),
    appBarTheme: AppBarTheme(color: allBlue,elevation: 0 ),

    scaffoldBackgroundColor: allBlack,
    bottomSheetTheme: const BottomSheetThemeData(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(12), topLeft: Radius.circular(12)))),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: allBlack,
      selectedIconTheme: IconThemeData(color: MyTheme.allBlue, size: 36),
      unselectedIconTheme: IconThemeData(color: MyTheme.allGrey, size: 24),
      showUnselectedLabels: false,
      showSelectedLabels: false,
    ),

  );


}
