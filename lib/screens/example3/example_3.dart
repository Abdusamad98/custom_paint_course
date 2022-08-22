import 'package:flutter/material.dart';

class Example3 extends StatefulWidget {
  const Example3({Key? key}) : super(key: key);

  @override
  State<Example3> createState() => _Example3State();
}

class _Example3State extends State<Example3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Custom Painter: drawCircle"),
      ),
      body: Center(
        child: Container(
          color: Colors.blue,
          child: CustomPaint(
            size: const Size(300, 300),
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
    // print(size.width);
    // print(size.height);
    var paint = Paint()..color = Colors.green;

    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 100, paint);
  }

  //Exercise: Aylanani kvadratga har tomondan urintining!

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
