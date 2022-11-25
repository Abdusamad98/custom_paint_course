import 'package:flutter/material.dart';

class Example2 extends StatefulWidget {
  const Example2({Key? key}) : super(key: key);

  @override
  State<Example2> createState() => _Example2State();
}

class _Example2State extends State<Example2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Custom Painter: drawRect"),
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
    print(size.width);
    print(size.height);
    var paint1 = Paint()..color = Colors.red;
    var paint2 = Paint()..color = Colors.green;
    canvas.drawRect(
      const Offset(0, 0) & const Size(150, 150),
     // Rect.fromCenter(center:  Offset(size.height/2, size.width/2), width: 50, height: 50),
      paint1,
    );
    canvas.drawRect(
      //const Offset(0, 0) & const Size(150, 150),
      Rect.fromCenter(center: const Offset(150, 170), width: 50, height: 50),
      paint2,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
