part of '../app.dart';

class StatusPill extends StatelessWidget {
  const StatusPill(
    this.label, {
    this.color = AppColors.teal,
    this.background,
    super.key,
  });
  final String label;
  final Color color;
  final Color? background;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
        decoration: BoxDecoration(
          color: background ?? color.withValues(alpha: .11),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
              color: color, fontSize: 10, fontWeight: FontWeight.w800),
        ),
      );
}
