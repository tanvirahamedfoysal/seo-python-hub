part of '../app.dart';

class _DiscussionRow extends StatelessWidget {
  const _DiscussionRow({
    required this.title,
    required this.topic,
    required this.replies,
    required this.activity,
    required this.state,
    required this.color,
  });
  final String title;
  final String topic;
  final String replies;
  final String activity;
  final String state;
  final Color color;
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: color.withValues(alpha: .11),
                borderRadius: BorderRadius.circular(11),
              ),
              child: Icon(Icons.forum_outlined, color: color, size: 19),
            ),
            const SizedBox(width: 13),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      StatusPill(topic, color: color),
                      const SizedBox(width: 8),
                      Text(
                        '$replies  ·  $activity',
                        style: const TextStyle(
                          color: AppColors.inkMuted,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            StatusPill(
              state,
              color: AppColors.inkMuted,
              background: AppColors.canvas,
            ),
            const Icon(
              Icons.chevron_right_rounded,
              color: AppColors.inkMuted,
              size: 18,
            ),
          ],
        ),
      );
}
