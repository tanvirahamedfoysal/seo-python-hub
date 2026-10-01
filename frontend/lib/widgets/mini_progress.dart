part of '../app.dart';

class MiniProgress extends StatelessWidget {
  const MiniProgress({
    required this.value,
    this.color = AppColors.teal,
    super.key,
  });
  final double value;
  final Color color;

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: LinearProgressIndicator(
          value: value,
          minHeight: 7,
          backgroundColor: AppColors.line,
          valueColor: AlwaysStoppedAnimation(color),
        ),
      );
}
