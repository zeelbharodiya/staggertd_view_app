import 'package:flutter/material.dart';
import 'package:staggered_view/views/screens/homepage.dart';
import 'package:staggered_view/views/screens/sliderspage.dart';



void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/' : (context) => HomePage(),
       'SliderPage' : (context) => SliderPage(),
      },
    ),
  );
}