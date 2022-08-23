import 'package:custom_paint_course/constatnts/constants.dart';
import 'package:custom_paint_course/widgets/my_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> routeNames = [
    example0Route,
    example1Route,
    example2Route,
    example3Route,
    example4Route,
    example5Route,
    example6Route,
    example7Route,
    example8Route,
    example9Route,
    example10Route,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animations"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...List.generate(
              routeNames.length,
              (index) => ListTile(
                title: Text("Example ${index}"),
                onTap: () {
                  Navigator.pushNamed(context, routeNames[index]);
                },
              ),
            ),
            ListTile(
              title: const Text("Hero Animation"),
              onTap: () {
                Navigator.pushNamed(context, heroAnimationScreen);
              },
            ),
            ListTile(
              title: const Text("Test Screen"),
              onTap: () {
                Navigator.pushNamed(context, testScreen);
              },
            ),

            myButton(() {
              Navigator.pushNamed(context, example3Route);
            })
          ],
        ),
      ),
    );
  }
}
//https://medium.com/flutter-community/paths-in-flutter-a-visual-guide-6c906464dcd0
