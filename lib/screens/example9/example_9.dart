
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
        backgroundColor: Colors.white,
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
          //    Image.asset("assets/gifs/cubic_to.gif")
            ],
          ),
        ));
  }
}

class MyPainter extends CustomPainter {


  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill
      ..strokeWidth = 8.0;

    Path path = Path();
    //P0
    path.lineTo(0, size.height * 0.5);

    path.cubicTo(
      //P1
      size.width * 0.4,
      size.height * 0.2,
      //P2
      size.width * 0.5,
      size.height * 0.7,
      //P3
      size.width,
      size.height * 0.5,
    );

    path.lineTo(size.width, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
