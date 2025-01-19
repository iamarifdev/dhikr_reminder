import 'package:flutter/material.dart';

class ProgressBorderPainter extends CustomPainter {
  final double percentage;
  // final Color borderColor;
  final double borderWidth;
  static Color borderColor = Colors.green.shade400;

  ProgressBorderPainter({
    required this.percentage,
    // this.borderColor = Colors.green.shade800,
    this.borderWidth = 15.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(
      0,
      0,
      size.width,
      size.height,
    );
    final radius = size.width / 2;

    // Draw the full rounded border as a background
    final backgroundPaint = Paint()
      ..color = Colors.grey.shade300
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    canvas.drawCircle(rect.center, radius - borderWidth / 2, backgroundPaint);

    // Draw the progress part of the border
    final progressPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth
      ..strokeCap = StrokeCap.round;

    final sweepAngle = 2 * 3.141592653589793 * percentage;

    canvas.drawArc(
      Rect.fromCircle(center: rect.center, radius: radius - borderWidth / 2),
      -3.141592653589793 / 2, // Start at the top of the circle
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Redraw whenever percentage changes
  }
}
