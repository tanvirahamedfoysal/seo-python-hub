part of '../app.dart';

class _BarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final values = [
      0.38,
      0.54,
      0.43,
      0.74,
      0.66,
      0.91,
      0.6,
      0.82,
      0.5,
      0.72,
      0.94,
      0.78,
      0.9,
      0.62,
    ];
    const gap = 8.0;
    final width = (size.width - gap * (values.length - 1)) / values.length;
    for (var i = 0; i < values.length; i++) {
      final height = size.height * values[i];
      final paint = Paint()
        ..color = i > 9 ? AppColors.teal : AppColors.teal.withValues(alpha: .25);
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(i * (width + gap), size.height - height, width, height),
          const Radius.circular(5),
        ),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
