
import 'dart:ui';

import 'package:flutter/material.dart';

class Example9 extends StatefulWidget {
  const Example9({Key? key}) : super(key: key);

  @override
  State<Example9> createState() => _Example9State();
}

class _Example9State extends State<Example9> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       // backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("drawPath cubicTo"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.blue,
                child: CustomPaint(
                  size: const Size(300, 300),
                  painter: MyPainter(
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Image.asset("assets/gifs/cubic_to.gif")
            ],
          ),
        ));
  }
}

class MyPainter extends CustomPainter {


  @override
  void paint(Canvas canvas, Size size) {
    //canvas.drawPaint(Paint()..color = Colors.blue);

    /// Translate method shifts the coordinate of the canvas, in this case we are shifting
    /// the point of origin to the top-center of  the canvas
    canvas.translate(size.width / 2, 0);

    final width = size.width / 2;

    Path bezierPath = Path()
      ..moveTo(-width, size.height)
      ..lineTo(-width, size.height * 0.6)
      ..cubicTo(
        -width * 0.2,
        size.height * 0.3,
        0,
        size.height * 0.8,
        width,
        size.height * 0.6,
      )
      ..lineTo(width, size.height);

    final bezierPaint = Paint()
      ..shader = const LinearGradient(colors: [
        Colors.green,
        Colors.greenAccent,
      ]).createShader(Offset(-width, size.height) & size);

    canvas.drawPath(bezierPath, bezierPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
