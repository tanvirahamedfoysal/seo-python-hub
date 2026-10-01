part of '../app.dart';

class _NotificationsPreview extends StatelessWidget {
  const _NotificationsPreview();
  @override
  Widget build(BuildContext context) => const SectionCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _CardTitle(title: 'Recent notifications', action: 'View all'),
            SizedBox(height: 15),
            _NotificationRow(
              icon: Icons.reply_rounded,
              title: 'Jules replied to your discussion',
              time: '12 min ago',
              color: AppColors.teal,
            ),
            _NotificationRow(
              icon: Icons.emoji_events_outlined,
              title: 'You reached a 12 day streak',
              time: 'Yesterday',
              color: AppColors.gold,
            ),
            _NotificationRow(
              icon: Icons.auto_awesome_outlined,
              title: 'A new guide matches your path',
              time: '2 days ago',
              color: AppColors.violet,
            ),
          ],
        ),
      );
}
