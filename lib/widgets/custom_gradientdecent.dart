import 'package:flutter/material.dart';

class GradientBorder extends StatelessWidget {
  final Widget child;
  final List<Color> colors;
  final double strokeWidth;

  GradientBorder({required this.child, required this.colors, this.strokeWidth = 3.0});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: CustomPaint(
        painter: _GradientBorderPainter(colors: colors, strokeWidth: strokeWidth),
        child: child,
      ),
    );
  }
}

class _GradientBorderPainter extends CustomPainter {
  final List<Color> colors;
  final double strokeWidth;

  _GradientBorderPainter({required this.colors, required this.strokeWidth});

  @override
  void paint(Canvas canvas, Size size) {
    final Rect outerRect = Offset.zero & size;
    final Rect innerRect = outerRect.deflate(strokeWidth / 2.0);

    final Paint paint = Paint()
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..shader = LinearGradient(
        colors: colors,
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ).createShader(outerRect);

    final Path path = Path()
      ..addOval(outerRect)
      ..addOval(innerRect)
      ..fillType = PathFillType.evenOdd;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}