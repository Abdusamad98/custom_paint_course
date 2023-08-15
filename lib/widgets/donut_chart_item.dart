import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class DonutChartWidget extends StatefulWidget {
  const DonutChartWidget({Key? key, required this.dataset}) : super(key: key);

  final List<DataItem> dataset;

  @override
  State<DonutChartWidget> createState() => _DonutChartWidgetState();
}

class _DonutChartWidgetState extends State<DonutChartWidget> {
  late Timer timer;
  double fullAngle = 0.0;
  static const secondsToComplete = 5.0;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(
      const Duration(
        milliseconds: 1000 ~/ 60,
      ),
      (timer) {
        setState(() {
          fullAngle += 360.0 / (secondsToComplete * 1000 ~/ 60);
          if (fullAngle >= 360) {
            fullAngle = 360.0;
            timer.cancel();
          }
        });
      },
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.width,
      child: Center(
        child: CustomPaint(
          painter: DonutChartPainter(
            dataset: widget.dataset,
            fullAngle: fullAngle,
          ),
          child: Container(),
        ),
      ),
    );
  }
}

final linePaint = Paint()
  ..color = Colors.white
  ..strokeWidth = 1.0
  ..style = PaintingStyle.stroke;

final midPaint = Paint()
  ..color = Colors.green
  ..strokeWidth = 1.0
  ..style = PaintingStyle.fill;

const labelStyle = TextStyle(
  fontSize: 16,
  color: Colors.white,
);

class DonutChartPainter extends CustomPainter {
  DonutChartPainter({
    required this.dataset,
    required this.fullAngle,
  });

  final List<DataItem> dataset;
  final double fullAngle;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2.0, size.width / 2);
    final radius = size.width * 0.9;
    final rect = Rect.fromCenter(center: center, width: radius, height: radius);
    var startAngle = 0.0;
    canvas.drawArc(rect, startAngle, fullAngle * pi / 180.0, true, linePaint);
    for (var di in dataset) {
      // draw sectors
      final sweepAngle = di.value * fullAngle * pi / 180.0;
      final paint = Paint()
        ..style = PaintingStyle.fill
        ..color = di.color;
      canvas.drawArc(rect, startAngle, sweepAngle, true, paint);
      //draw lines
      final dx = radius / 2.0 * cos(startAngle);
      final dy = radius / 2.0 * sin(startAngle);
      final p2 = center + Offset(dx, dy);
      canvas.drawLine(center, p2, linePaint);
      // draw center circle
      canvas.drawCircle(center, radius * 0.3, midPaint);
      // draw text centered
      drawTextCentered(canvas, center, "",
          const TextStyle(fontSize: 24, color: Colors.black), radius * 0.6);
      //draw Labels
      drawLabels(
        canvas,
        center,
        radius,
        startAngle,
        sweepAngle,
        di.label,
      );
      startAngle += sweepAngle;
    }
  }

  TextPainter measureText(
    String s,
    TextStyle style,
    double maxWidth,
    TextAlign align,
  ) {
    final span = TextSpan(text: s, style: style);
    final tp = TextPainter(
      text: span,
      textAlign: align,
      textDirection: TextDirection.ltr,
    );

    //ellipsis...)
    tp.layout(minWidth: 0.0, maxWidth: maxWidth);
    return tp;
  }

  Size drawTextCentered(
    Canvas canvas,
    Offset position,
    String text,
    TextStyle style,
    double maxWidth,
  ) {
    final tp = measureText(text, style, maxWidth, TextAlign.center);
    final pos = position + Offset(-tp.width / 2.0, -tp.height / 2.0);
    tp.paint(canvas, pos);
    return tp.size;
  }

  void drawLabels(
    Canvas canvas,
    Offset c,
    double radius,
    double startAngle,
    double sweepAngle,
    String label,
  ) {
    final r = radius * 0.4;
    final dx = r * cos(startAngle + sweepAngle / 2.0);
    final dy = r * sin(startAngle + sweepAngle / 2.0);
    final position = c + Offset(dx, dy);
    drawTextCentered(canvas, position, label, labelStyle, 100.0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class DataItem {
  DataItem({
    required this.value,
    required this.color,
    required this.label,
  });

  final double value;
  final String label;
  final Color color;
}
