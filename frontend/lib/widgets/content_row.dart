part of '../app.dart';

class _ContentRow extends StatelessWidget {
  const _ContentRow({
    required this.type,
    required this.title,
    required this.slug,
    required this.author,
    required this.date,
    required this.state,
    required this.color,
  });
  final String type;
  final String title;
  final String slug;
  final String author;
  final String date;
  final String state;
  final Color color;
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Row(
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: color.withValues(alpha: .11),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                type == 'TOPIC'
                    ? Icons.article_outlined
                    : type == 'GUIDE'
                        ? Icons.menu_book_outlined
                        : Icons.layers_outlined,
                color: color,
                size: 18,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(width: 8),
                      StatusPill(type, color: color),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '$slug  ·  $author  ·  $date',
                    style: const TextStyle(
                        color: AppColors.inkMuted, fontSize: 10),
                  ),
                ],
              ),
            ),
            StatusPill(
              state,
              color: state == 'Published'
                  ? AppColors.teal
                  : state == 'Draft'
                      ? AppColors.violet
                      : AppColors.gold,
            ),
            const SizedBox(width: 8),
            IconButton(
              tooltip: 'Edit content',
              icon: const Icon(
                Icons.edit_outlined,
                size: 18,
                color: AppColors.inkMuted,
              ),
              onPressed: () => _notice(context, 'Opening editor for $title'),
            ),
          ],
        ),
      );
}
