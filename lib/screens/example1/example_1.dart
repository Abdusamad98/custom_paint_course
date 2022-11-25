import 'package:flutter/material.dart';

class Example1 extends StatefulWidget {
  const Example1({Key? key}) : super(key: key);

  @override
  State<Example1> createState() => _Example1State();
}

class _Example1State extends State<Example1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Custom Painter: drawLine"),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.blue,
            child: CustomPaint(
              size: const Size(200, 200),
              painter: MyPainter(),
            ),
          ),
        ],
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // print(size.width);
    // print(size.height);
    var paint = Paint()
     ..color = Colors.red
     ..strokeWidth = 4.0;

    canvas.drawLine(
       Offset(100, 100),//(100,100)
       Offset(200, 100),//(200,100)
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
