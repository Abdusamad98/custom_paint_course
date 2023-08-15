import 'dart:math';

import 'package:flutter/material.dart';

class MyView extends StatefulWidget {
  const MyView({super.key});

  @override
  State<MyView> createState() => _MyViewState();
}

class _MyViewState extends State<MyView> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 10));
    animation =
        Tween<double>(begin: 0, end: 2 * pi - 0.3).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.linear,
      reverseCurve: Curves.easeOut,
    ))
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {});
    animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomPaint(
          size: const Size(300, 300),
          painter: MyViewPainter(radian: animation.value),
        ),
      ),
    );
  }
}

class MyViewPainter extends CustomPainter {
  MyViewPainter({required this.radian});

  final double radian;

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = const Offset(0, 0) & const Size(200, 200);
    const startAngle = 0.0;
    final paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill
      ..strokeWidth = 4;


    canvas.drawArc(rect, startAngle, radian, true, paint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
