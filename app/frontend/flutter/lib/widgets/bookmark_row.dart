part of '../app.dart';

class _BookmarkRow extends StatelessWidget {
  const _BookmarkRow({
    required this.icon,
    required this.title,
    required this.summary,
    required this.type,
    required this.category,
    required this.saved,
    required this.color,
  });
  final IconData icon;
  final String title;
  final String summary;
  final String type;
  final String category;
  final String saved;
  final Color color;
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 13),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: color.withValues(alpha: .11),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: color, size: 20),
            ),
            const SizedBox(width: 13),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(width: 8),
                      StatusPill(type, color: color),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    summary,
                    style: const TextStyle(
                        color: AppColors.inkMuted, fontSize: 12),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    '$category  ·  $saved',
                    style: const TextStyle(
                      color: AppColors.inkMuted,
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              tooltip: 'Remove bookmark',
              icon: const Icon(Icons.bookmark_rounded, color: AppColors.gold),
              onPressed: () => _notice(context, 'Bookmark removed'),
            ),
          ],
        ),
      );
}
