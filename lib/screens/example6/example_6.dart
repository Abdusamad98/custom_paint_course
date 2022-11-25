
import 'dart:ui';

import 'package:flutter/material.dart';

class Example6 extends StatefulWidget {
  const Example6({Key? key}) : super(key: key);

  @override
  State<Example6> createState() => _Example6State();
}

class _Example6State extends State<Example6> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Custom Painter: drawPath"),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          color: Colors.blue,
          child: CustomPaint(
            size: const Size(300, 300),
            painter: MyPainter(),
            child: Center(
              child: Container(
                width: 100,
                height: 100,
                // color: Colors.yellow,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    var path = Path();
    // moveTo and  lineTo
    path.moveTo(20, size.height / 2);
    path.lineTo(size.width / 2, size.height / 2);
    path.lineTo(size.width / 2, size.height - 20);
    path.lineTo(20, size.height - 20);
    path.lineTo(20, size.height / 2);

    canvas.drawPath(path, paint);
    //lineTo and quadraticBezierTo

    // path.lineTo(0, size.height * 0.65);
    //
    // path.quadraticBezierTo(
    //   size.width * 0.2,
    //   size.height * 0.4,
    //   size.width * 0.5,
    //   size.height * 0.6,
    // );
    //
    // path.quadraticBezierTo(
    //   size.width * 0.8,
    //   size.height * 0.8,
    //   size.width,
    //   size.height * 0.5,
    // );
    // path.lineTo(size.width, 0);
    // path.close();
    // canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
