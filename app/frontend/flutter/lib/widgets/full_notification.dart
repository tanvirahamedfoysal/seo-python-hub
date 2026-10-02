part of '../app.dart';

class _FullNotification extends StatelessWidget {
  const _FullNotification({
    required this.icon,
    required this.title,
    required this.body,
    required this.time,
    required this.color,
    required this.unread,
  });
  final IconData icon;
  final String title;
  final String body;
  final String time;
  final Color color;
  final bool unread;
  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColors.line)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: color.withValues(alpha: .12),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 18),
            ),
            const SizedBox(width: 13),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight:
                                unread ? FontWeight.w800 : FontWeight.w600,
                          ),
                        ),
                      ),
                      if (unread)
                        const StatusPill(
                          'NEW',
                          color: AppColors.coral,
                          background: AppColors.coralSoft,
                        ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    body,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.inkMuted,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    time,
                    style: const TextStyle(
                        fontSize: 10, color: AppColors.inkMuted),
                  ),
                ],
              ),
            ),
            IconButton(
              tooltip: 'Mark as read',
              icon: Icon(
                unread
                    ? Icons.circle_outlined
                    : Icons.check_circle_outline_rounded,
                size: 18,
                color: unread ? AppColors.teal : AppColors.inkMuted,
              ),
              onPressed: () => _notice(context, 'Notification state updated'),
            ),
          ],
        ),
      );
}
