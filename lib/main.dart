import 'package:custom_paint_course/constatnts/constants.dart';
import 'package:custom_paint_course/screens/emaple/my_view.dart';
import 'package:custom_paint_course/screens/hero_animation.dart';
import 'package:custom_paint_course/screens/home_screen.dart';
import 'package:custom_paint_course/screens/router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyView(),
      // onGenerateRoute: MyRouter.generateRoute,
      // initialRoute: homeRoute,
    );
  }
}
