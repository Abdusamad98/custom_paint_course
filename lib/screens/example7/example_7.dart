import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class Example7 extends StatefulWidget {
  const Example7({Key? key}) : super(key: key);

  @override
  State<Example7> createState() => _Example7State();
}

class _Example7State extends State<Example7> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Custom Painter: Example"),
      ),
      body: Center(
        child: Container(
          color: Colors.white,
          child: CustomPaint(
            size: const Size(200, 200),
            painter: MyPainter(),
          ),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final radius = min(size.width, size.height) / 2;
    final center = Offset(size.width / 2, size.height / 2);

    //Draw the body
    var paint = Paint()..color = Colors.yellow;
    canvas.drawCircle(center, radius, paint);
    //Draw the mouth
    final smilePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10;
    canvas.drawArc(
      Rect.fromCenter(center: center, width: radius, height: radius), 0,
      pi,
      false,
      smilePaint,
    );
    //Draw the eyes
    canvas.drawCircle(
        Offset(center.dx - radius / 2, center.dy - radius / 2), 15, Paint());
    canvas.drawCircle(
        Offset(center.dx + radius / 2, center.dy - radius / 2), 15, Paint());
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
