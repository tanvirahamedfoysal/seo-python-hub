part of '../app.dart';

class _AttentionRow extends StatelessWidget {
  const _AttentionRow({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.route,
  });
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final String route;
  /*
  Widget build(BuildContext context) => InkWell(onTap: () => Navigator.of(context).pushReplacementNamed(route), child: Padding(padding: const EdgeInsets.symmetric(vertical: 9), child: Row(children: [Icon(icon, color: color, size: 20), const SizedBox(width: 12), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700)), const SizedBox(height: 3), Text(subtitle, style: const TextStyle(color: AppColors.inkMuted, fontSize: 11))])), const Icon(Icons.chevron_right_rounded, color: AppColors.inkMuted, size: 18)]));
  */
  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () => Navigator.of(context).pushReplacementNamed(route),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 9),
          child: Row(
            children: [
              Icon(icon, color: color, size: 20),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: AppColors.inkMuted,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.chevron_right_rounded,
                color: AppColors.inkMuted,
                size: 18,
              ),
            ],
          ),
        ),
      );
}
