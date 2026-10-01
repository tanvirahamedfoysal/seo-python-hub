part of '../app.dart';

class _AdminLink extends StatelessWidget {
  const _AdminLink({
    required this.icon,
    required this.label,
    required this.route,
    required this.color,
  });
  final IconData icon;
  final String label;
  final String route;
  final Color color;
  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () => Navigator.of(context).pushReplacementNamed(route),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 11),
          decoration: BoxDecoration(
            color: AppColors.canvas,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: color, size: 17),
              const SizedBox(width: 8),
              Text(
                label,
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
              ),
              const SizedBox(width: 7),
              const Icon(
                Icons.arrow_outward_rounded,
                size: 14,
                color: AppColors.inkMuted,
              ),
            ],
          ),
        ),
      );
}
