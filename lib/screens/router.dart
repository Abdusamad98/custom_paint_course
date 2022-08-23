import 'package:custom_paint_course/constatnts/constants.dart';
import 'package:custom_paint_course/screens/TestScreen.dart';
import 'package:custom_paint_course/screens/example0/example_0.dart';
import 'package:custom_paint_course/screens/example1/example_1.dart';
import 'package:custom_paint_course/screens/example10/example_10.dart';
import 'package:custom_paint_course/screens/example2/example_2.dart';
import 'package:custom_paint_course/screens/example3/example_3.dart';
import 'package:custom_paint_course/screens/example4/example_4.dart';
import 'package:custom_paint_course/screens/example5/example_5.dart';
import 'package:custom_paint_course/screens/example6/example_6.dart';
import 'package:custom_paint_course/screens/example7/example_7.dart';
import 'package:custom_paint_course/screens/example8/example_8.dart';
import 'package:custom_paint_course/screens/example9/example_9.dart';
import 'package:custom_paint_course/screens/hero_animation.dart';
import 'package:custom_paint_course/screens/home_screen.dart';
import 'package:flutter/material.dart';

class MyRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case example0Route:
        return MaterialPageRoute(builder: (_) => Example0());
      case example1Route:
        return MaterialPageRoute(builder: (_) => Example1());
      case example2Route:
        return MaterialPageRoute(builder: (_) => Example2());
      case example3Route:
        return MaterialPageRoute(builder: (_) => Example3());
      case example4Route:
        return MaterialPageRoute(builder: (_) => Example4());
      case example5Route:
        return MaterialPageRoute(builder: (_) => Example5());
      case example6Route:
        return MaterialPageRoute(builder: (_) => Example6());
      case example7Route:
        return MaterialPageRoute(builder: (_) => Example7());
      case example8Route:
        return MaterialPageRoute(builder: (_) => Example8());
      case example9Route:
        return MaterialPageRoute(builder: (_) => Example9());
      case example10Route:
        return MaterialPageRoute(builder: (_) => Example10());
      case testScreen:
        return MaterialPageRoute(builder: (_) => TestScreen());
      case heroAnimationScreen:
        return MaterialPageRoute(builder: (_) => HeroAnimation());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
