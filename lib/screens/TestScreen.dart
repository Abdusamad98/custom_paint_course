import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Test Screen"),
        ),
        body: Center(
          child: Container(
            color: Colors.blue,
            child: CustomPaint(
              size: const Size(300, 300),
              painter: MyPainter(),
            ),
          ),
        ));
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint1 = Paint()
      ..strokeWidth = 2
      ..color = Colors.white;

    final paint2 = Paint()
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round
      ..color = Colors.red;

    canvas.drawLine(const Offset(100, 100), const Offset(200, 200), paint1);
    canvas.drawLine(const Offset(50, 200), const Offset(200, 120), paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
