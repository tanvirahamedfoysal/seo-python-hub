part of '../app.dart';

class _ReportRow extends StatelessWidget {
  const _ReportRow({
    required this.reason,
    required this.title,
    required this.discussionContext,
    required this.reporter,
    required this.state,
    required this.color,
  });
  final String reason;
  final String title;
  final String discussionContext;
  final String reporter;
  final String state;
  final Color color;
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: color.withValues(alpha: .12),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(Icons.flag_outlined, color: color, size: 18),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        reason,
                        style: TextStyle(
                          color: color,
                          fontSize: 10,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(width: 8),
                      StatusPill(state, color: color),
                    ],
                  ),
                  const SizedBox(height: 7),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    discussionContext,
                    style: const TextStyle(
                        color: AppColors.inkMuted, fontSize: 11),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    reporter,
                    style: const TextStyle(
                        color: AppColors.inkMuted, fontSize: 10),
                  ),
                ],
              ),
            ),
            OutlinedButton(
              onPressed: () => _notice(context, 'Opening moderation detail'),
              child: const Text('Review'),
            ),
          ],
        ),
      );
}
