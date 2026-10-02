part of '../app.dart';

class _ActivityPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final grid = Paint()
      ..color = AppColors.line
      ..strokeWidth = 1;
    for (var i = 0; i < 4; i++) {
      final y = i * size.height / 3;
      canvas.drawLine(Offset(0, y), Offset(size.width, y), grid);
    }
    final line = Paint()
      ..color = AppColors.teal
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;
    final points = [
      Offset(0, size.height * .7),
      Offset(size.width * .15, size.height * .57),
      Offset(size.width * .29, size.height * .65),
      Offset(size.width * .44, size.height * .25),
      Offset(size.width * .58, size.height * .47),
      Offset(size.width * .73, size.height * .3),
      Offset(size.width * .87, size.height * .37),
      Offset(size.width, size.height * .12),
    ];
    final path = Path()..moveTo(points.first.dx, points.first.dy);
    for (var i = 1; i < points.length; i++) {
      path.lineTo(points[i].dx, points[i].dy);
    }
    canvas.drawPath(path, line);
    final dots = Paint()..color = AppColors.coral;
    for (final point in points) {
      canvas.drawCircle(point, 4, dots);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
