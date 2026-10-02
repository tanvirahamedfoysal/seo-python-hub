part of '../app.dart';

class _PulsePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final fill = Paint()..color = AppColors.teal.withValues(alpha: .12);
    final line = Paint()
      ..color = AppColors.teal
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    final points = [
      Offset(0, size.height * .68),
      Offset(size.width * .12, size.height * .56),
      Offset(size.width * .25, size.height * .62),
      Offset(size.width * .39, size.height * .46),
      Offset(size.width * .5, size.height * .52),
      Offset(size.width * .63, size.height * .3),
      Offset(size.width * .76, size.height * .37),
      Offset(size.width * .9, size.height * .18),
      Offset(size.width, size.height * .23),
    ];
    final path = Path()..moveTo(points.first.dx, points.first.dy);
    for (var i = 1; i < points.length; i++) {
      path.lineTo(points[i].dx, points[i].dy);
    }
    final area = Path.from(path)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(area, fill);
    canvas.drawPath(path, line);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
