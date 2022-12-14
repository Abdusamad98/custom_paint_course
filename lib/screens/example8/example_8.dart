
import 'dart:ui';

import 'package:flutter/material.dart';

class Example8 extends StatefulWidget {
  const Example8({Key? key}) : super(key: key);

  @override
  State<Example8> createState() => _Example8State();
}

class _Example8State extends State<Example8> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("drawPath quadraticBezierTo"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.blue,
                child: CustomPaint(
                  size: const Size(300, 300),
                  painter: MyPainter(),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Image.asset("assets/gifs/quadratic_bezier_to.gif")
            ],
          ),
        ));
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = Colors.yellow;
    paint.strokeWidth = 2.0;
    Path path = Path();
    path.moveTo(0, size.height / 2);
    path.quadraticBezierTo(
      size.width * 0.5,
      size.height * -.5,
      size.width * 1,
      size.height * 0.5,
    );
    // path.quadraticBezierTo(size.width * 0.75, size.height * 0.9,
    //     size.width * 1.0, size.height * 0.8);
    // path.lineTo(size.width, size.height);
    // path.lineTo(0, size.height);
    // canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
