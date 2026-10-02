part of '../app.dart';

class _TrendPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final grid = Paint()
      ..color = AppColors.line
      ..strokeWidth = 1;
    for (var i = 0; i < 4; i++) {
      canvas.drawLine(
        Offset(0, i * size.height / 3),
        Offset(size.width, i * size.height / 3),
        grid,
      );
    }
    final points = [
      Offset(0, size.height * .72),
      Offset(size.width * .08, size.height * .7),
      Offset(size.width * .18, size.height * .64),
      Offset(size.width * .3, size.height * .66),
      Offset(size.width * .42, size.height * .5),
      Offset(size.width * .54, size.height * .54),
      Offset(size.width * .65, size.height * .37),
      Offset(size.width * .78, size.height * .29),
      Offset(size.width * .88, size.height * .23),
      Offset(size.width, size.height * .12),
    ];
    final line = Paint()
      ..color = AppColors.coral
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    final path = Path()..moveTo(points.first.dx, points.first.dy);
    for (var i = 1; i < points.length; i++) {
      path.lineTo(points[i].dx, points[i].dy);
    }
    canvas.drawPath(path, line);
    final dot = Paint()..color = AppColors.coral;
    for (final point in points) {
      canvas.drawCircle(point, 4, dot);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
