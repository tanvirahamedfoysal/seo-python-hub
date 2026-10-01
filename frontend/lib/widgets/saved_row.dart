part of '../app.dart';

class _SavedRow extends StatelessWidget {
  const _SavedRow({
    required this.icon,
    required this.title,
    required this.type,
    required this.color,
  });
  final IconData icon;
  final String title;
  final String type;
  final Color color;
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: color.withValues(alpha: .11),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, size: 18, color: color),
            ),
            const SizedBox(width: 11),
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
                    type,
                    style: const TextStyle(
                        fontSize: 11, color: AppColors.inkMuted),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.open_in_new_rounded,
              color: AppColors.inkMuted,
              size: 16,
            ),
          ],
        ),
      );
}
